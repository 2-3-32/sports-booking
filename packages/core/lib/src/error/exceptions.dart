/// Base exception class
class AppException implements Exception {
  final String message;
  final String? code;
  
  AppException(this.message, [this.code]);
  
  @override
  String toString() => 'AppException: $message ${code != null ? '(Code: $code)' : ''}';
}

/// Server exception
class ServerException extends AppException {
  ServerException([String message = 'Server error occurred', String? code]) 
      : super(message, code);
}

/// Cache exception
class CacheException extends AppException {
  CacheException([String message = 'Cache error occurred', String? code]) 
      : super(message, code);
}

/// Network exception
class NetworkException extends AppException {
  NetworkException([String message = 'Network connection failed', String? code]) 
      : super(message, code);
}

/// Authentication exception
class AuthenticationException extends AppException {
  AuthenticationException([String message = 'Authentication failed', String? code]) 
      : super(message, code);
}

/// Validation exception
class ValidationException extends AppException {
  ValidationException([String message = 'Validation failed', String? code]) 
      : super(message, code);
}

