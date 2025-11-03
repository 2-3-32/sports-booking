/// Application constants
class AppConstants {
  // App Info
  static const String appName = 'Booking App';
  static const String appVersion = '1.0.0';
  
  // Firebase Collections
  static const String usersCollection = 'users';
  static const String bookingsCollection = 'bookings';
  static const String categoriesCollection = 'categories';
  static const String servicesCollection = 'services';
  static const String reviewsCollection = 'reviews';
  static const String notificationsCollection = 'notifications';
  
  // Storage Paths
  static const String userProfileImages = 'user_profiles';
  static const String serviceImages = 'service_images';
  static const String bookingDocuments = 'booking_documents';
  
  // User Roles
  static const String roleUser = 'user';
  static const String roleAdmin = 'admin';
  static const String roleSuperAdmin = 'super_admin';
  
  // Booking Status
  static const String bookingPending = 'pending';
  static const String bookingConfirmed = 'confirmed';
  static const String bookingInProgress = 'in_progress';
  static const String bookingCompleted = 'completed';
  static const String bookingCancelled = 'cancelled';
  
  // Shared Preferences Keys
  static const String keyUserId = 'user_id';
  static const String keyUserRole = 'user_role';
  static const String keyIsLoggedIn = 'is_logged_in';
  static const String keyThemeMode = 'theme_mode';
  static const String keyLanguage = 'language';
  static const String keyFcmToken = 'fcm_token';
  
  // Notification Topics
  static const String topicAllUsers = 'all_users';
  static const String topicAdmins = 'admins';
  static const String topicBookingUpdates = 'booking_updates';
  
  // API Timeouts
  static const int connectionTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000;
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  
  // Date Formats
  static const String dateFormat = 'yyyy-MM-dd';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'yyyy-MM-dd HH:mm';
  static const String displayDateFormat = 'MMM dd, yyyy';
  
  // Validation
  static const int minPasswordLength = 8;
  static const int maxNameLength = 50;
  static const int minPhoneLength = 10;
  static const int maxDescriptionLength = 500;
}

/// Error messages
class ErrorMessages {
  static const String networkError = 'No internet connection';
  static const String serverError = 'Server error. Please try again later';
  static const String authError = 'Authentication failed';
  static const String unknownError = 'An unknown error occurred';
  static const String timeoutError = 'Request timeout. Please try again';
  static const String validationError = 'Please check your input';
  static const String permissionDenied = 'Permission denied';
  static const String notFound = 'Resource not found';
}

/// Success messages
class SuccessMessages {
  static const String loginSuccess = 'Login successful';
  static const String logoutSuccess = 'Logout successful';
  static const String registrationSuccess = 'Registration successful';
  static const String bookingCreated = 'Booking created successfully';
  static const String bookingUpdated = 'Booking updated successfully';
  static const String bookingCancelled = 'Booking cancelled successfully';
  static const String profileUpdated = 'Profile updated successfully';
  static const String passwordChanged = 'Password changed successfully';
}

