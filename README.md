# Booking Application - Flutter Monorepo

A professional booking application with separate **User** and **Admin** apps built with Flutter, Firebase, and Clean Architecture.

## 🚀 Project Structure

```
booking/
├── user_app/                 # Customer-facing booking application
├── admin_app/                # Admin management application
├── packages/
│   └── core/                 # Shared business logic, models, and services
├── README.md
└── pubspec.yaml              # Workspace configuration
```

## ✨ Features

### User App
- Browse and search bookings
- Make reservations
- Manage profile
- View booking history
- Push notifications
- Payment integration ready

### Admin App
- Dashboard with analytics
- Manage bookings
- User management
- Revenue tracking
- Notifications management
- Reports and insights

## 📱 Supported Platforms
- ✅ iOS (.ipa)
- ✅ Android (.apk / .aab)

## 🛠 Tech Stack

- **Framework**: Flutter (Dart)
- **State Management**: BLoC Pattern
- **Backend**: Firebase
  - Authentication
  - Cloud Firestore
  - Cloud Storage
  - Cloud Messaging (FCM)
  - Cloud Functions (optional)
- **Architecture**: Clean Architecture (Feature-based)
- **Dependency Injection**: get_it
- **Routing**: go_router

## 📋 Prerequisites

### For Development
1. **Flutter SDK** (Latest stable version)
   ```bash
   # Install Flutter: https://docs.flutter.dev/get-started/install
   flutter --version
   ```

2. **Dart SDK** (comes with Flutter)

3. **IDE**: VS Code or Android Studio with Flutter plugins

### For iOS Development (.ipa builds)
1. **Mac computer** (required)
2. **Xcode** (latest version from App Store)
3. **CocoaPods** (iOS dependency manager)
   ```bash
   sudo gem install cocoapods
   ```
4. **Apple Developer Account** ($99/year for distribution)

### For Android Development
1. **Android Studio**
2. **Android SDK** (API level 21+)
3. **Java JDK**

## 🔥 Firebase Setup

1. **Create Firebase Project**
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Create a new project
   - Enable these services:
     - Authentication (Email/Password, Google Sign-in)
     - Cloud Firestore
     - Cloud Storage
     - Cloud Messaging

2. **Configure iOS App**
   ```bash
   # In Firebase Console, add iOS app
   # Download GoogleService-Info.plist
   # Place in: user_app/ios/Runner/ and admin_app/ios/Runner/
   ```

3. **Configure Android App**
   ```bash
   # In Firebase Console, add Android app
   # Download google-services.json
   # Place in: user_app/android/app/ and admin_app/android/app/
   ```

4. **Install FlutterFire CLI** (recommended)
   ```bash
   dart pub global activate flutterfire_cli
   
   # Configure Firebase for both apps
   cd user_app
   flutterfire configure
   
   cd ../admin_app
   flutterfire configure
   ```

## 🚀 Getting Started

### 1. Install Flutter
```bash
# macOS
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"

# Verify installation
flutter doctor
```

### 2. Install Dependencies
```bash
# Install for all packages
cd booking

# User app
cd user_app
flutter pub get

# Admin app
cd ../admin_app
flutter pub get

# Core package
cd ../packages/core
flutter pub get
```

### 3. Run the Apps

#### User App
```bash
cd user_app

# Run on iOS simulator
flutter run -d ios

# Run on Android emulator
flutter run -d android

# Run on connected device
flutter run
```

#### Admin App
```bash
cd admin_app
flutter run
```

## 📦 Building for Production

### iOS (.ipa)

1. **Setup Signing**
   - Open Xcode: `open user_app/ios/Runner.xcworkspace`
   - Select Runner target
   - Go to "Signing & Capabilities"
   - Select your Team and enable "Automatically manage signing"

2. **Build .ipa**
   ```bash
   cd user_app
   
   # Build for App Store
   flutter build ipa --release
   
   # Output: build/ios/ipa/user_app.ipa
   ```

3. **Distribution Options**
   - **TestFlight**: Upload .ipa via Xcode or Transporter app
   - **App Store**: Submit via App Store Connect
   - **Ad-Hoc**: For testing on specific devices

### Android (.apk / .aab)

1. **Setup Signing**
   ```bash
   # Generate keystore
   keytool -genkey -v -keystore ~/booking-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias booking
   ```

2. **Configure signing** (see user_app/android/key.properties)

3. **Build**
   ```bash
   cd user_app
   
   # Build APK
   flutter build apk --release
   
   # Build App Bundle (for Play Store)
   flutter build appbundle --release
   ```

## 🏗 Architecture

### Clean Architecture Layers

```
feature/
├── data/
│   ├── datasources/      # API, Firebase, local DB
│   ├── models/           # Data models with JSON serialization
│   └── repositories/     # Repository implementations
├── domain/
│   ├── entities/         # Business models
│   ├── repositories/     # Repository contracts
│   └── usecases/         # Business logic
└── presentation/
    ├── bloc/             # State management
    ├── pages/            # Screens
    └── widgets/          # Reusable UI components
```

### Dependency Flow
```
Presentation → Domain ← Data
     ↓           ↓         ↓
   BLoC    →  UseCase → Repository → DataSource
```

## 📱 App Icons & Splash Screens

```bash
# Install flutter_launcher_icons
flutter pub add flutter_launcher_icons --dev

# Configure in pubspec.yaml and run
flutter pub run flutter_launcher_icons

# Install flutter_native_splash
flutter pub add flutter_native_splash --dev
flutter pub run flutter_native_splash:create
```

## 🧪 Testing

```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test

# Generate coverage
flutter test --coverage
```

## 🔧 Useful Commands

```bash
# Check for issues
flutter doctor

# Clean build
flutter clean

# Update dependencies
flutter pub upgrade

# Analyze code
flutter analyze

# Format code
dart format .

# Check outdated packages
flutter pub outdated
```

## 📊 Performance

- **Build Size Optimization**
  ```bash
  flutter build apk --split-per-abi --release
  ```

- **Code Obfuscation**
  ```bash
  flutter build ipa --obfuscate --split-debug-info=./debug-info
  ```

## 🔐 Security Best Practices

1. **Never commit**:
   - Firebase config files (add to .gitignore)
   - API keys
   - Keystore files

2. **Use Environment Variables** for sensitive data

3. **Enable Firebase Security Rules**

4. **Use HTTPS** for all API calls

## 📚 Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase for Flutter](https://firebase.flutter.dev/)
- [BLoC Pattern](https://bloclibrary.dev/)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

## 🤝 Contributing

1. Follow the established architecture
2. Write tests for new features
3. Run `flutter analyze` before committing
4. Follow Dart style guide

## 📝 License

MIT License

---

**Happy Coding! 🎉**

