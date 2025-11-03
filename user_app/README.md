# User App - Booking Application

Customer-facing mobile application for managing bookings.

## Features

- ✅ User Authentication (Email, Google Sign-in)
- ✅ Browse Services
- ✅ Create Bookings
- ✅ View Booking History
- ✅ Manage Profile
- ✅ Push Notifications
- ✅ Real-time Updates

## Architecture

### Clean Architecture
- **Presentation Layer**: BLoC, Pages, Widgets
- **Domain Layer**: Entities, Use Cases, Repositories (interfaces)
- **Data Layer**: Models, Data Sources, Repositories (implementations)

### State Management
- Flutter BLoC Pattern
- Dependency Injection (get_it)

## Project Structure

```
lib/
├── config/
│   ├── routes/          # App routing (go_router)
│   └── theme/           # App theme and colors
├── core/
│   └── di/              # Dependency injection
├── features/
│   ├── auth/            # Authentication feature
│   ├── home/            # Home feature
│   ├── bookings/        # Bookings feature
│   ├── profile/         # Profile feature
│   └── splash/          # Splash screen
└── main.dart            # App entry point
```

## Setup

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Configure Firebase:
   - Add `google-services.json` to `android/app/`
   - Add `GoogleService-Info.plist` to `ios/Runner/`

3. Run the app:
   ```bash
   flutter run
   ```

## Build

### iOS (.ipa)
```bash
flutter build ipa --release
```

### Android (.apk)
```bash
flutter build apk --release
```

### Android (.aab for Play Store)
```bash
flutter build appbundle --release
```

## Dependencies

See `pubspec.yaml` for complete list of dependencies.

## Testing

```bash
flutter test
```

