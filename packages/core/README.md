# Core Package

Shared business logic, models, and services for the Booking Application.

## Structure

```
core/
├── lib/
│   ├── src/
│   │   ├── data/              # Data layer
│   │   │   ├── datasources/   # Remote/Local data sources
│   │   │   ├── models/        # Data models
│   │   │   └── repositories/  # Repository implementations
│   │   ├── domain/            # Domain layer
│   │   │   ├── entities/      # Business entities
│   │   │   ├── repositories/  # Repository interfaces
│   │   │   └── usecases/      # Business logic
│   │   ├── error/             # Error handling
│   │   ├── network/           # Network utilities
│   │   ├── services/          # App services
│   │   ├── utils/             # Utilities
│   │   └── di/                # Dependency injection
│   └── core.dart              # Public API
└── pubspec.yaml
```

## Features

- Firebase Authentication (Email, Google Sign-in)
- Cloud Firestore integration
- Firebase Storage for file uploads
- Push notifications (FCM)
- Clean Architecture patterns
- Error handling
- Validation utilities
- Dependency injection

## Usage

Add to your app's `pubspec.yaml`:

```yaml
dependencies:
  core:
    path: ../packages/core
```

Then import:

```dart
import 'package:core/core.dart';
```

## Initialization

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await FirebaseService.instance.initialize();
  
  // Initialize dependencies
  await initializeDependencies();
  
  // Initialize notifications
  await NotificationService.instance.initialize();
  
  runApp(MyApp());
}
```

