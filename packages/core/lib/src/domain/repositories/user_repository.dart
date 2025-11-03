import 'package:dartz/dartz.dart';
import '../../error/failures.dart';
import '../entities/user_entity.dart';

/// User repository interface
abstract class UserRepository {
  /// Get user by ID
  Future<Either<Failure, UserEntity>> getUserById(String userId);

  /// Update user profile
  Future<Either<Failure, UserEntity>> updateUserProfile({
    required String userId,
    String? name,
    String? phoneNumber,
    String? photoUrl,
  });

  /// Upload profile photo
  Future<Either<Failure, String>> uploadProfilePhoto({
    required String userId,
    required String filePath,
  });

  /// Delete user account
  Future<Either<Failure, void>> deleteUserAccount(String userId);

  /// Get all users (admin only)
  Future<Either<Failure, List<UserEntity>>> getAllUsers();

  /// Update user role (admin only)
  Future<Either<Failure, UserEntity>> updateUserRole({
    required String userId,
    required String role,
  });

  /// Deactivate user (admin only)
  Future<Either<Failure, UserEntity>> deactivateUser(String userId);

  /// Activate user (admin only)
  Future<Either<Failure, UserEntity>> activateUser(String userId);
}

