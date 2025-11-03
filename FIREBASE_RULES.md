# 🔥 Firebase Configuration

Complete Firebase setup including Security Rules, Storage Rules, and Cloud Functions.

## 🔐 Firestore Security Rules

Go to Firebase Console → Firestore Database → Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    
    // Helper functions
    function isAuthenticated() {
      return request.auth != null;
    }
    
    function isOwner(userId) {
      return request.auth.uid == userId;
    }
    
    function isAdmin() {
      return isAuthenticated() && 
             get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role in ['admin', 'super_admin'];
    }
    
    function getUserRole() {
      return get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role;
    }
    
    // Users Collection
    match /users/{userId} {
      // Anyone authenticated can read users
      allow read: if isAuthenticated();
      
      // Users can update their own profile or admins can update any
      allow create: if isAuthenticated();
      allow update: if isOwner(userId) || isAdmin();
      allow delete: if isAdmin();
    }
    
    // Bookings Collection
    match /bookings/{bookingId} {
      // Users can read their own bookings, admins can read all
      allow read: if isAuthenticated() && 
                     (isOwner(resource.data.userId) || isAdmin());
      
      // Users can create bookings
      allow create: if isAuthenticated() && 
                       isOwner(request.resource.data.userId);
      
      // Users can update/cancel their own bookings, admins can update any
      allow update: if isAuthenticated() && 
                       (isOwner(resource.data.userId) || isAdmin());
      
      // Only admins can delete
      allow delete: if isAdmin();
    }
    
    // Services Collection
    match /services/{serviceId} {
      // Anyone authenticated can read services
      allow read: if isAuthenticated();
      
      // Only admins can write
      allow write: if isAdmin();
    }
    
    // Categories Collection
    match /categories/{categoryId} {
      allow read: if isAuthenticated();
      allow write: if isAdmin();
    }
    
    // Reviews Collection
    match /reviews/{reviewId} {
      allow read: if isAuthenticated();
      allow create: if isAuthenticated() && 
                       isOwner(request.resource.data.userId);
      allow update, delete: if isAuthenticated() && 
                               (isOwner(resource.data.userId) || isAdmin());
    }
    
    // Notifications Collection
    match /notifications/{notificationId} {
      allow read: if isAuthenticated() && 
                     isOwner(resource.data.userId);
      allow write: if isAdmin();
    }
    
    // Analytics Collection (admin only)
    match /analytics/{document=**} {
      allow read, write: if isAdmin();
    }
  }
}
```

## 📦 Storage Security Rules

Go to Firebase Console → Storage → Rules

```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    
    // Helper functions
    function isAuthenticated() {
      return request.auth != null;
    }
    
    function isOwner(userId) {
      return request.auth.uid == userId;
    }
    
    function isValidImageSize() {
      return request.resource.size < 5 * 1024 * 1024; // 5MB
    }
    
    function isValidImage() {
      return request.resource.contentType.matches('image/.*');
    }
    
    // User Profile Images
    match /user_profiles/{userId}/{allPaths=**} {
      allow read: if isAuthenticated();
      allow write: if isAuthenticated() && 
                      isOwner(userId) && 
                      isValidImage() && 
                      isValidImageSize();
    }
    
    // Service Images (admin only)
    match /service_images/{allPaths=**} {
      allow read: if isAuthenticated();
      allow write: if isAuthenticated() && 
                      firestore.get(/databases/(default)/documents/users/$(request.auth.uid)).data.role in ['admin', 'super_admin'] &&
                      isValidImage() &&
                      isValidImageSize();
    }
    
    // Booking Documents
    match /booking_documents/{bookingId}/{allPaths=**} {
      allow read: if isAuthenticated();
      allow write: if isAuthenticated() &&
                      isValidImageSize();
    }
  }
}
```

## ☁️ Cloud Functions (Optional)

Create `functions/index.js`:

```javascript
const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

// Send notification when booking is created
exports.onBookingCreated = functions.firestore
  .document('bookings/{bookingId}')
  .onCreate(async (snap, context) => {
    const booking = snap.data();
    
    // Get user's FCM token
    const userDoc = await admin.firestore()
      .collection('users')
      .doc(booking.userId)
      .get();
    
    if (!userDoc.exists) return null;
    
    const fcmToken = userDoc.data().fcmToken;
    if (!fcmToken) return null;
    
    // Send notification
    const message = {
      notification: {
        title: 'Booking Confirmed',
        body: `Your booking for ${booking.serviceName} is confirmed!`,
      },
      token: fcmToken,
    };
    
    try {
      await admin.messaging().send(message);
      console.log('Notification sent successfully');
    } catch (error) {
      console.error('Error sending notification:', error);
    }
    
    return null;
  });

// Send notification when booking status changes
exports.onBookingStatusChanged = functions.firestore
  .document('bookings/{bookingId}')
  .onUpdate(async (change, context) => {
    const before = change.before.data();
    const after = change.after.data();
    
    // Check if status changed
    if (before.status === after.status) return null;
    
    // Get user's FCM token
    const userDoc = await admin.firestore()
      .collection('users')
      .doc(after.userId)
      .get();
    
    if (!userDoc.exists) return null;
    
    const fcmToken = userDoc.data().fcmToken;
    if (!fcmToken) return null;
    
    // Determine notification message
    let title = 'Booking Update';
    let body = '';
    
    switch (after.status) {
      case 'confirmed':
        body = 'Your booking has been confirmed!';
        break;
      case 'in_progress':
        body = 'Your booking is now in progress.';
        break;
      case 'completed':
        body = 'Your booking has been completed. Thank you!';
        break;
      case 'cancelled':
        body = 'Your booking has been cancelled.';
        break;
      default:
        body = 'Your booking status has been updated.';
    }
    
    // Send notification
    const message = {
      notification: { title, body },
      token: fcmToken,
    };
    
    try {
      await admin.messaging().send(message);
    } catch (error) {
      console.error('Error sending notification:', error);
    }
    
    return null;
  });

// Cleanup old bookings (runs daily)
exports.cleanupOldBookings = functions.pubsub
  .schedule('0 0 * * *') // Every day at midnight
  .timeZone('America/New_York')
  .onRun(async (context) => {
    const sixMonthsAgo = new Date();
    sixMonthsAgo.setMonth(sixMonthsAgo.getMonth() - 6);
    
    const snapshot = await admin.firestore()
      .collection('bookings')
      .where('createdAt', '<', sixMonthsAgo)
      .where('status', 'in', ['completed', 'cancelled'])
      .get();
    
    const batch = admin.firestore().batch();
    
    snapshot.forEach((doc) => {
      batch.delete(doc.ref);
    });
    
    await batch.commit();
    console.log(`Deleted ${snapshot.size} old bookings`);
    
    return null;
  });

// Generate daily analytics
exports.generateDailyAnalytics = functions.pubsub
  .schedule('0 1 * * *') // Every day at 1 AM
  .timeZone('America/New_York')
  .onRun(async (context) => {
    const yesterday = new Date();
    yesterday.setDate(yesterday.getDate() - 1);
    yesterday.setHours(0, 0, 0, 0);
    
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    
    // Get bookings created yesterday
    const bookingsSnapshot = await admin.firestore()
      .collection('bookings')
      .where('createdAt', '>=', yesterday)
      .where('createdAt', '<', today)
      .get();
    
    // Calculate metrics
    let totalBookings = bookingsSnapshot.size;
    let totalRevenue = 0;
    let statusCounts = {
      pending: 0,
      confirmed: 0,
      in_progress: 0,
      completed: 0,
      cancelled: 0,
    };
    
    bookingsSnapshot.forEach((doc) => {
      const booking = doc.data();
      totalRevenue += booking.price || 0;
      statusCounts[booking.status]++;
    });
    
    // Save analytics
    await admin.firestore()
      .collection('analytics')
      .doc(yesterday.toISOString().split('T')[0])
      .set({
        date: yesterday,
        totalBookings,
        totalRevenue,
        statusCounts,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
      });
    
    console.log('Daily analytics generated');
    return null;
  });
```

## 🚀 Deploy Cloud Functions

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize functions
firebase init functions

# Deploy functions
firebase deploy --only functions
```

## 📧 Email Templates (Optional)

Configure email templates in Firebase Console → Authentication → Templates:

### Verification Email
```
Subject: Verify your email for Booking App

Hi %DISPLAY_NAME%,

Thanks for signing up! Please verify your email address by clicking the link below:

%LINK%

If you didn't create an account, you can safely ignore this email.

Thanks,
Booking App Team
```

### Password Reset
```
Subject: Reset your password for Booking App

Hi %DISPLAY_NAME%,

We received a request to reset your password. Click the link below to create a new password:

%LINK%

If you didn't request this, you can safely ignore this email.

Thanks,
Booking App Team
```

## 🎯 Indexes

Some queries may require composite indexes. Create them in Firebase Console or they'll be auto-suggested when you run queries.

Example indexes:

```javascript
// bookings collection
- userId (Ascending) + createdAt (Descending)
- status (Ascending) + bookingDate (Ascending)
- userId (Ascending) + status (Ascending)

// users collection
- role (Ascending) + isActive (Ascending)
```

## ✅ Security Checklist

- ✅ Enable App Check for additional security
- ✅ Set up budget alerts
- ✅ Configure data retention policies
- ✅ Enable audit logging
- ✅ Set up backup schedules
- ✅ Configure CORS for web app
- ✅ Review security rules regularly
- ✅ Monitor Firebase usage

---

**Important**: Always test your security rules thoroughly before deploying to production!

