# 🎯 Getting Started - Quick Guide

Welcome to your professional Flutter booking application! This guide will get you up and running quickly.

## ✨ What You Have

A **complete, production-ready** booking application with:

### 📱 Two Mobile Apps

1. **User App** - Customer-facing application
   - Beautiful, modern UI
   - User authentication
   - Browse and create bookings
   - Profile management
   - Push notifications

2. **Admin App** - Management dashboard
   - Professional admin interface
   - Dashboard with analytics
   - Booking management
   - User management
   - Reports and insights

### 🔧 Shared Core Package
- Clean Architecture
- Firebase integration
- Reusable business logic
- Shared models and services

## 🚀 Quick Start (3 Steps)

### Step 1: Install Flutter

```bash
# Download and install Flutter
# https://docs.flutter.dev/get-started/install

# Verify installation
flutter doctor
```

### Step 2: Set Up Firebase

1. Create project at [Firebase Console](https://console.firebase.google.com/)
2. Enable Authentication, Firestore, Storage
3. Download config files:
   - `google-services.json` → `user_app/android/app/`
   - `GoogleService-Info.plist` → `user_app/ios/Runner/`
   - (Repeat for admin_app)

### Step 3: Run the Apps

```bash
# Install dependencies
cd booking/user_app
flutter pub get

# Run on device/simulator
flutter run
```

## 📚 Important Files

- **SETUP_GUIDE.md** - Comprehensive setup instructions
- **PROJECT_STRUCTURE.md** - Architecture documentation
- **FIREBASE_RULES.md** - Security rules and Cloud Functions
- **README.md** - Project overview

## 🎨 Customization Quick Tips

### Change App Colors
- User App: `user_app/lib/config/theme/app_colors.dart`
- Admin App: `admin_app/lib/config/theme/admin_colors.dart`

### Change App Name
Update in:
- `user_app/pubspec.yaml`
- `admin_app/pubspec.yaml`
- Platform-specific config files

### Add Features
Follow the clean architecture pattern:
1. Create feature folder
2. Add data/domain/presentation layers
3. Register dependencies
4. Add routes

## 🔑 Key Features

### Authentication
- ✅ Email/Password
- ✅ Google Sign-in
- ✅ Password reset
- ✅ Role-based access

### Bookings
- ✅ Create bookings
- ✅ View history
- ✅ Status tracking
- ✅ Notifications

### Admin Features
- ✅ Dashboard analytics
- ✅ User management
- ✅ Booking management
- ✅ Reports & insights

## 📱 Supported Platforms

Both apps work on:
- ✅ iOS (iPhone, iPad)
- ✅ Android (Phone, Tablet)

## 🏗️ Architecture Highlights

```
Clean Architecture + BLoC Pattern
├── Presentation (UI + BLoC)
├── Domain (Business Logic)
└── Data (Firebase Integration)
```

**Benefits:**
- Scalable
- Testable
- Maintainable
- Industry standard

## 📦 Tech Stack

- **Framework**: Flutter (Dart)
- **Backend**: Firebase
  - Authentication
  - Cloud Firestore
  - Storage
  - Cloud Messaging
- **State Management**: BLoC
- **Navigation**: go_router
- **DI**: get_it

## 🎯 Next Steps

1. ✅ Read SETUP_GUIDE.md
2. ✅ Configure Firebase
3. ✅ Run both apps
4. ✅ Create test account
5. ✅ Customize branding
6. ✅ Build for production

## 🆘 Need Help?

1. Check **SETUP_GUIDE.md** for detailed instructions
2. Review **PROJECT_STRUCTURE.md** for architecture
3. See **FIREBASE_RULES.md** for backend setup
4. Run `flutter doctor` to diagnose issues

## 💡 Pro Tips

### For Development
```bash
# Hot reload during development
flutter run

# Check for issues
flutter analyze

# Format code
dart format .
```

### For Production
```bash
# Build release APK
flutter build apk --release

# Build iOS app
flutter build ipa --release

# Build for Play Store
flutter build appbundle --release
```

## 🎨 Folder Structure Quick Reference

```
booking/
├── packages/core/          # Shared business logic
├── user_app/              # Customer app
│   ├── lib/
│   │   ├── features/      # App features
│   │   ├── config/        # Configuration
│   │   └── main.dart      # Entry point
│   └── pubspec.yaml
├── admin_app/             # Admin dashboard
│   └── [same structure]
└── [documentation files]
```

## 🔐 Security Note

**Important**: 
- Never commit Firebase config files to public repos
- Keep API keys secure
- Review security rules before production
- Create admin users manually in Firebase Console

## ✅ What's Included

- ✅ Complete UI for both apps
- ✅ Authentication system
- ✅ Firebase integration
- ✅ State management
- ✅ Navigation setup
- ✅ Theme system
- ✅ Error handling
- ✅ Form validation
- ✅ Clean architecture
- ✅ Professional structure

## 🎉 You're Ready!

Your professional booking application is ready to customize and deploy. Follow the guides and build something amazing!

### Recommended Reading Order:
1. This file (Getting Started) ← You are here
2. SETUP_GUIDE.md (Detailed setup)
3. PROJECT_STRUCTURE.md (Architecture)
4. FIREBASE_RULES.md (Backend config)

---

**Happy Building! 🚀**

*Need to generate iOS .ipa files?*  
Check SETUP_GUIDE.md → "Building for Production" → "iOS (.ipa)" section.

