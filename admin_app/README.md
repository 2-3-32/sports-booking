# Admin App - Booking Management System

Administrative dashboard for managing bookings, users, and analytics.

## Features

- ✅ Secure Admin Authentication
- ✅ Dashboard with Statistics
- ✅ Booking Management
- ✅ User Management
- ✅ Analytics & Reports
- ✅ Settings & Configuration
- ✅ Real-time Updates
- ✅ Export Data

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
│   ├── auth/            # Admin authentication
│   ├── dashboard/       # Dashboard with stats
│   ├── bookings/        # Bookings management
│   ├── users/           # User management
│   ├── analytics/       # Analytics & reports
│   ├── settings/        # App settings
│   ├── shared/          # Shared widgets
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

## Admin Access

**Important**: Only users with admin role can access this app. Make sure to:
1. Create admin users in Firebase Console
2. Set `role` field to `admin` or `super_admin` in Firestore users collection

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

## Features Overview

### Dashboard
- Overview statistics
- Recent bookings
- Quick actions
- Performance metrics

### Bookings Management
- View all bookings
- Filter by status
- Update booking status
- View detailed information

### User Management
- View all users
- User statistics
- Suspend/activate users
- View user booking history

### Analytics
- Revenue charts
- Booking trends
- Top services
- Performance metrics

### Settings
- Business information
- Notification settings
- Service management
- Security settings
- Data export

## Testing

```bash
flutter test
```

## Dependencies

See `pubspec.yaml` for complete list of dependencies.

