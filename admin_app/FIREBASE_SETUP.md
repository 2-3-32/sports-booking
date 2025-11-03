# 🔥 Firebase Setup for Admin App

## Current Status

The admin app is currently running with **DEMO Firebase configuration**. To make the app fully functional, you need to configure it with your actual Firebase project.

## Why is the page blank?

The page may appear blank or show errors because:
1. ❌ Firebase is not properly configured with real project credentials
2. ❌ No Firebase project is connected
3. ❌ Authentication won't work with demo credentials

## Quick Fix - Configure Real Firebase

### Option 1: Use FlutterFire CLI (Recommended)

```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure Firebase (will prompt you to select your project)
cd /Users/htcuser/Documents/passion/booking/admin_app
flutterfire configure
```

This will automatically:
- Connect to your Firebase project
- Generate the correct `firebase_options.dart` file
- Configure all platforms (web, iOS, Android)

### Option 2: Manual Configuration

1. **Go to Firebase Console**: https://console.firebase.google.com/
2. **Select your project** or create a new one
3. **Add Web App**:
   - Click the web icon (</>)
   - Register your app
   - Copy the Firebase configuration
4. **Update `lib/firebase_options.dart`** with your actual values:

```dart
static const FirebaseOptions web = FirebaseOptions(
  apiKey: 'YOUR-ACTUAL-API-KEY',
  appId: '1:XXXXX:web:XXXXX',
  messagingSenderId: 'YOUR-SENDER-ID',
  projectId: 'your-project-id',
  authDomain: 'your-project-id.firebaseapp.com',
  storageBucket: 'your-project-id.appspot.com',
  measurementId: 'G-XXXXXXXXXX',
);
```

## After Configuration

1. Stop the current app (press `q` in terminal or Ctrl+C)
2. Restart: `flutter run -d chrome`
3. The app should now work properly!

## Creating Admin Users

Once Firebase is configured, you need to create admin users:

1. Go to Firebase Console → Firestore Database
2. Create a user document in the `users` collection:

```json
{
  "email": "admin@example.com",
  "name": "Admin User",
  "role": "admin",  // or "super_admin"
  "isActive": true,
  "createdAt": "2025-11-03T00:00:00.000Z"
}
```

3. The UID should match the Firebase Authentication user ID

## Demo Mode

The app includes error handling that allows it to start even without proper Firebase configuration, but features will be limited:
- ✅ UI will load
- ❌ Authentication won't work
- ❌ No data will be saved
- ❌ Real-time updates disabled

## Need Help?

Check the main project documentation:
- `/booking/SETUP_GUIDE.md`
- `/booking/FIREBASE_RULES.md`
- `/booking/GETTING_STARTED.md`

