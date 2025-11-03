# 📁 Project Structure

Comprehensive overview of the booking application architecture.

## 🗂️ Directory Structure

```
booking/
├── packages/
│   └── core/                          # Shared core package
│       ├── lib/
│       │   ├── src/
│       │   │   ├── data/
│       │   │   │   ├── datasources/   # Firebase data sources
│       │   │   │   ├── models/        # Data models
│       │   │   │   └── repositories/  # Repository implementations
│       │   │   ├── domain/
│       │   │   │   ├── entities/      # Business entities
│       │   │   │   └── repositories/  # Repository interfaces
│       │   │   ├── error/             # Error handling
│       │   │   ├── network/           # Network utilities
│       │   │   ├── services/          # Firebase services
│       │   │   ├── utils/             # Constants & validators
│       │   │   └── di/                # Dependency injection
│       │   └── core.dart              # Public API
│       └── pubspec.yaml
│
├── user_app/                          # Customer-facing app
│   ├── lib/
│   │   ├── config/
│   │   │   ├── routes/                # Navigation (go_router)
│   │   │   └── theme/                 # App theme
│   │   ├── core/
│   │   │   └── di/                    # App DI setup
│   │   ├── features/
│   │   │   ├── auth/                  # Authentication
│   │   │   │   ├── data/
│   │   │   │   │   └── repositories/
│   │   │   │   ├── domain/
│   │   │   │   │   └── usecases/
│   │   │   │   └── presentation/
│   │   │   │       ├── bloc/          # BLoC state management
│   │   │   │       ├── pages/         # UI pages
│   │   │   │       └── widgets/       # Reusable widgets
│   │   │   ├── home/                  # Home feature
│   │   │   ├── bookings/              # Bookings feature
│   │   │   ├── profile/               # Profile feature
│   │   │   └── splash/                # Splash screen
│   │   └── main.dart
│   ├── android/                       # Android config
│   ├── ios/                           # iOS config
│   └── pubspec.yaml
│
├── admin_app/                         # Admin dashboard app
│   ├── lib/
│   │   ├── config/
│   │   │   ├── routes/                # Navigation
│   │   │   └── theme/                 # Admin theme
│   │   ├── core/
│   │   │   └── di/                    # App DI setup
│   │   ├── features/
│   │   │   ├── auth/                  # Admin auth
│   │   │   ├── dashboard/             # Dashboard
│   │   │   ├── bookings/              # Booking management
│   │   │   ├── users/                 # User management
│   │   │   ├── analytics/             # Analytics
│   │   │   ├── settings/              # Settings
│   │   │   └── shared/                # Shared widgets
│   │   └── main.dart
│   ├── android/
│   ├── ios/
│   └── pubspec.yaml
│
├── README.md                          # Project overview
├── SETUP_GUIDE.md                     # Setup instructions
└── PROJECT_STRUCTURE.md               # This file
```

## 🏗️ Architecture

### Clean Architecture Layers

```
┌─────────────────────────────────────────┐
│         Presentation Layer              │
│   (BLoC, Pages, Widgets)               │
│   - User Interface                      │
│   - State Management                    │
│   - User Input Handling                 │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│           Domain Layer                   │
│   (Entities, Use Cases, Repositories)   │
│   - Business Logic                      │
│   - Business Rules                      │
│   - Repository Interfaces               │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│            Data Layer                    │
│   (Models, DataSources, Repos Impl)     │
│   - API Integration                     │
│   - Firebase Operations                 │
│   - Data Mapping                        │
└─────────────────────────────────────────┘
```

## 📦 Core Package

Shared functionality between User and Admin apps:

### Key Components

- **Entities**: Pure business objects
  - `UserEntity`
  - `BookingEntity`

- **Repositories**: Data access contracts
  - `AuthRepository`
  - `BookingRepository`
  - `UserRepository`

- **Services**:
  - `FirebaseService` - Firebase initialization
  - `NotificationService` - FCM handling
  - `StorageService` - File uploads

- **Utilities**:
  - `Constants` - App-wide constants
  - `Validators` - Input validation
  - `Failures` - Error types
  - `Exceptions` - Exception types

## 👥 User App

Customer-facing mobile application.

### Features

1. **Authentication**
   - Email/Password login
   - Google Sign-in
   - Registration
   - Password reset

2. **Home**
   - Dashboard
   - Quick actions
   - Recent bookings

3. **Bookings**
   - Browse services
   - Create booking
   - View history
   - Booking details

4. **Profile**
   - Edit profile
   - Change password
   - Settings
   - Logout

### State Management

- **BLoC Pattern**
  - `AuthBloc` - Authentication state
  - Separate BLoCs for each feature

### Navigation

- **go_router**
  - Declarative routing
  - Deep linking support
  - Type-safe navigation

## 👨‍💼 Admin App

Management dashboard for administrators.

### Features

1. **Dashboard**
   - Statistics overview
   - Recent bookings
   - Quick metrics

2. **Bookings Management**
   - View all bookings
   - Update status
   - Filter & search
   - Booking details

3. **User Management**
   - View all users
   - User statistics
   - Suspend/activate
   - User details

4. **Analytics**
   - Revenue charts
   - Booking trends
   - Top services
   - Performance metrics

5. **Settings**
   - Business info
   - Services management
   - Security settings
   - Data export

### Key Differences from User App

- Admin-only authentication
- Role-based access control
- Advanced data visualization
- Management capabilities

## 🔄 Data Flow

### Example: Creating a Booking

```
User Input (UI)
    │
    ▼
BookingBloc
    │
    ▼
CreateBookingUseCase
    │
    ▼
BookingRepository (Interface)
    │
    ▼
BookingRepositoryImpl
    │
    ▼
FirebaseBookingDataSource
    │
    ▼
Cloud Firestore
    │
    ▼
Success/Failure Response
    │
    ▼
BookingBloc (Update State)
    │
    ▼
UI Update
```

## 🎨 Design Patterns

### Used Throughout

1. **Repository Pattern**
   - Abstracts data sources
   - Easier testing
   - Flexible data source switching

2. **BLoC Pattern**
   - Predictable state management
   - Separation of concerns
   - Easy testing

3. **Dependency Injection**
   - Loose coupling
   - Better testability
   - Flexible configuration

4. **Either Type (Dartz)**
   - Functional error handling
   - No exceptions in business logic
   - Clear success/failure flow

## 📱 Platform Specifics

### iOS

```
user_app/ios/
├── Runner/
│   ├── Info.plist                    # App configuration
│   ├── GoogleService-Info.plist      # Firebase config
│   └── Assets.xcassets/              # App icons
└── Runner.xcworkspace/               # Xcode workspace
```

### Android

```
user_app/android/
├── app/
│   ├── build.gradle                  # App-level config
│   ├── google-services.json          # Firebase config
│   └── src/main/
│       ├── AndroidManifest.xml       # App manifest
│       └── res/                      # Resources
└── build.gradle                      # Project-level config
```

## 🧪 Testing Structure

```
test/
├── unit/
│   ├── domain/                       # Business logic tests
│   └── data/                         # Repository tests
├── widget/                           # Widget tests
└── integration/                      # E2E tests
```

## 🔐 Security Considerations

1. **Authentication**
   - Secure token storage
   - Auto-logout on token expiry
   - Role-based access control

2. **Data**
   - Firestore security rules
   - Encrypted sensitive data
   - Secure API calls

3. **Admin Access**
   - Admin role verification
   - Activity logging
   - Restricted endpoints

## 🚀 Performance Optimizations

1. **Caching**
   - Firestore offline persistence
   - Image caching
   - Local preferences

2. **Lazy Loading**
   - Pagination for lists
   - Deferred heavy operations
   - Dynamic imports

3. **State Management**
   - Efficient rebuilds
   - Stream subscriptions cleanup
   - Memory management

## 📊 Monitoring & Analytics

- **Firebase Analytics**: User behavior tracking
- **Crashlytics**: Crash reporting
- **Performance Monitoring**: App performance metrics

## 🔄 Future Enhancements

Potential areas for expansion:

1. **Payment Integration**
   - Stripe
   - PayPal
   - In-app purchases

2. **Advanced Features**
   - Real-time chat
   - Video calls
   - Calendar sync

3. **Multi-language**
   - Internationalization
   - RTL support

4. **Offline Mode**
   - Enhanced offline capabilities
   - Sync queue

---

This structure provides a **scalable**, **maintainable**, and **testable** codebase following industry best practices.

