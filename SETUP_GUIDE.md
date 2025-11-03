# 🚀 Complete Setup Guide - Booking Application

This guide will walk you through setting up the complete booking application ecosystem with User and Admin apps.

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

### Required Software

1. **Flutter SDK** (Latest stable version)
   ```bash
   # Check Flutter installation
   flutter doctor
   ```
   
   Download from: https://docs.flutter.dev/get-started/install

2. **Dart SDK** (comes with Flutter)

3. **IDE** (Choose one):
   - Visual Studio Code with Flutter extension
   - Android Studio with Flutter plugin

### For iOS Development
- **Mac computer** (required for iOS builds)
- **Xcode** (latest version from App Store)
- **CocoaPods**
   ```bash
   sudo gem install cocoapods
   ```

### For Android Development
- **Android Studio**
- **Android SDK** (API level 21+)
- **Java JDK**

## 🔥 Firebase Setup

### 1. Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add Project"
3. Enter project name: "booking-app"
4. Enable Google Analytics (recommended)
5. Click "Create Project"

### 2. Enable Firebase Services

In your Firebase project:

#### Authentication
1. Go to **Authentication** → **Sign-in method**
2. Enable:
   - Email/Password
   - Google (optional but recommended)

#### Cloud Firestore
1. Go to **Firestore Database**
2. Click "Create database"
3. Start in **Production mode**
4. Choose location (e.g., us-central)

#### Storage
1. Go to **Storage**
2. Click "Get started"
3. Start in **Production mode**

#### Cloud Messaging (FCM)
- Already enabled by default

### 3. Configure Firebase for iOS

1. In Firebase Console, click "Add app" → iOS
2. Enter iOS Bundle ID: `com.yourcompany.userapp` (for user app)
3. Download `GoogleService-Info.plist`
4. Place in: `user_app/ios/Runner/`
5. Repeat for admin app with different bundle ID

### 4. Configure Firebase for Android

1. In Firebase Console, click "Add app" → Android
2. Enter Android Package Name: `com.yourcompany.user_app`
3. Download `google-services.json`
4. Place in: `user_app/android/app/`
5. Repeat for admin app

### 5. FlutterFire CLI Setup (Recommended)

```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure User App
cd user_app
flutterfire configure

# Configure Admin App
cd ../admin_app
flutterfire configure
```

## 🔐 Firestore Security Rules

Go to Firestore → Rules and paste:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    
    // Users collection
    match /users/{userId} {
      allow read: if request.auth != null;
      allow write: if request.auth.uid == userId || 
                      get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role in ['admin', 'super_admin'];
    }
    
    // Bookings collection
    match /bookings/{bookingId} {
      allow read: if request.auth != null && 
                     (request.auth.uid == resource.data.userId || 
                      get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role in ['admin', 'super_admin']);
      allow create: if request.auth != null;
      allow update, delete: if request.auth != null && 
                               (request.auth.uid == resource.data.userId || 
                                get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role in ['admin', 'super_admin']);
    }
    
    // Services collection (admin only can write)
    match /services/{serviceId} {
      allow read: if request.auth != null;
      allow write: if request.auth != null && 
                      get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role in ['admin', 'super_admin'];
    }
  }
}
```

## 🗄️ Firestore Data Structure

Create these collections manually or they'll be created automatically:

### users
```javascript
{
  "id": "user_id_here",
  "email": "user@example.com",
  "name": "John Doe",
  "phoneNumber": "+1234567890",
  "photoUrl": "https://...",
  "role": "user", // or "admin", "super_admin"
  "createdAt": Timestamp,
  "updatedAt": Timestamp,
  "isActive": true
}
```

### bookings
```javascript
{
  "id": "booking_id_here",
  "userId": "user_id_here",
  "userName": "John Doe",
  "userPhone": "+1234567890",
  "serviceId": "service_id_here",
  "serviceName": "Haircut",
  "serviceDescription": "Professional haircut",
  "price": 50.00,
  "bookingDate": Timestamp,
  "bookingTime": "10:00",
  "status": "pending", // confirmed, in_progress, completed, cancelled
  "notes": "Optional notes",
  "createdAt": Timestamp,
  "updatedAt": Timestamp,
  "cancelledBy": null,
  "cancellationReason": null
}
```

## 📲 Installation Steps

### 1. Install Dependencies

```bash
# Navigate to project root
cd booking

# Install core package dependencies
cd packages/core
flutter pub get

# Install user app dependencies
cd ../../user_app
flutter pub get

# Install admin app dependencies
cd ../admin_app
flutter pub get
```

### 2. Create Admin User

Since admin registration is restricted, create your first admin user manually:

1. Go to Firebase Console → Authentication
2. Add user with email/password
3. Copy the User UID
4. Go to Firestore Database
5. Create document in `users` collection:
   ```javascript
   {
     "id": "paste_user_uid_here",
     "email": "admin@example.com",
     "name": "Admin User",
     "role": "admin",
     "createdAt": [current timestamp],
     "isActive": true
   }
   ```

## 🏃‍♂️ Running the Apps

### User App

```bash
cd user_app

# Run on iOS simulator
flutter run -d ios

# Run on Android emulator
flutter run -d android

# Run on connected device
flutter run
```

### Admin App

```bash
cd admin_app

# Run on iOS simulator
flutter run -d ios

# Run on Android emulator
flutter run -d android
```

## 📦 Building for Production

### User App

#### iOS (.ipa)
```bash
cd user_app

# Open Xcode
open ios/Runner.xcworkspace

# In Xcode:
# 1. Select Runner target
# 2. Go to "Signing & Capabilities"
# 3. Select your Team
# 4. Close Xcode

# Build .ipa
flutter build ipa --release

# Output: build/ios/ipa/user_app.ipa
```

#### Android (.apk)
```bash
cd user_app

# Build APK
flutter build apk --release

# Output: build/app/outputs/flutter-apk/app-release.apk
```

#### Android (.aab for Play Store)
```bash
cd user_app

# Generate keystore (first time only)
keytool -genkey -v -keystore ~/booking-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias booking

# Create key.properties file
echo "storePassword=your_store_password
keyPassword=your_key_password
keyAlias=booking
storeFile=$HOME/booking-key.jks" > android/key.properties

# Build App Bundle
flutter build appbundle --release

# Output: build/app/outputs/bundle/release/app-release.aab
```

### Admin App

Follow the same steps as User App, just navigate to `admin_app` directory.

## 🎨 Customization

### App Icons

1. Replace icons in:
   - `user_app/assets/icons/app_icon.png`
   - `admin_app/assets/icons/admin_icon.png`

2. Generate platform icons:
   ```bash
   # User app
   cd user_app
   flutter pub run flutter_launcher_icons
   
   # Admin app
   cd ../admin_app
   flutter pub run flutter_launcher_icons
   ```

### Splash Screens

1. Replace splash images in:
   - `user_app/assets/images/splash_logo.png`
   - `admin_app/assets/images/admin_splash_logo.png`

2. Generate splash screens:
   ```bash
   # User app
   cd user_app
   flutter pub run flutter_native_splash:create
   
   # Admin app
   cd ../admin_app
   flutter pub run flutter_native_splash:create
   ```

### Colors & Branding

- User App: `user_app/lib/config/theme/app_colors.dart`
- Admin App: `admin_app/lib/config/theme/admin_colors.dart`

## 🧪 Testing

```bash
# Test core package
cd packages/core
flutter test

# Test user app
cd ../../user_app
flutter test

# Test admin app
cd ../admin_app
flutter test
```

## 🐛 Troubleshooting

### Flutter Doctor Issues
```bash
flutter doctor -v
# Fix any issues listed
```

### iOS Build Issues
```bash
cd user_app/ios
pod deintegrate
pod install
cd ../..
flutter clean
flutter pub get
```

### Android Build Issues
```bash
cd user_app/android
./gradlew clean
cd ../..
flutter clean
flutter pub get
```

### Firebase Connection Issues
- Verify `google-services.json` and `GoogleService-Info.plist` are in correct locations
- Check bundle IDs match Firebase configuration
- Run `flutterfire configure` again

## 📚 Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase Documentation](https://firebase.google.com/docs)
- [FlutterFire Documentation](https://firebase.flutter.dev/)
- [BLoC Pattern Guide](https://bloclibrary.dev/)

## 🎉 Next Steps

After successful setup:

1. ✅ Test authentication in both apps
2. ✅ Create test bookings
3. ✅ Configure push notifications
4. ✅ Set up Cloud Functions (optional)
5. ✅ Configure analytics
6. ✅ Set up crash reporting
7. ✅ Deploy to stores

## 💡 Pro Tips

1. **Environment Variables**: Use different Firebase projects for dev/staging/production
2. **Continuous Integration**: Set up GitHub Actions or Codemagic
3. **Code Generation**: Run `flutter pub run build_runner build` when adding new models
4. **Performance**: Profile your app with `flutter run --profile`
5. **Debugging**: Use Flutter DevTools for advanced debugging

## 🆘 Support

If you encounter issues:
1. Check this guide thoroughly
2. Run `flutter doctor -v`
3. Check Firebase configuration
4. Verify all dependencies are installed

---

**Happy Coding! 🚀**

