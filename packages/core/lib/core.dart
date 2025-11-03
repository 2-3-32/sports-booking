library core;

// Common exports
export 'src/error/failures.dart';
export 'src/error/exceptions.dart';
export 'src/network/network_info.dart';
export 'src/utils/constants.dart';
export 'src/utils/validators.dart';

// Domain exports
export 'src/domain/entities/user_entity.dart';
export 'src/domain/entities/booking_entity.dart';
export 'src/domain/repositories/auth_repository.dart';
export 'src/domain/repositories/booking_repository.dart';
export 'src/domain/repositories/user_repository.dart';

// Data exports
export 'src/data/models/user_model.dart';
export 'src/data/models/booking_model.dart';
export 'src/data/datasources/firebase_auth_datasource.dart';

// Services
export 'src/services/firebase_service.dart';
export 'src/services/notification_service.dart';
export 'src/services/storage_service.dart';

// Dependency Injection
export 'src/di/injection.dart';

