import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

class AdminAuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource authDataSource;
  final NetworkInfo networkInfo;

  AdminAuthRepositoryImpl({
    required this.authDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserEntity>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      final user = await authDataSource.signInWithEmail(email, password);
      
      // Check if user has admin role
      if (user.role != 'admin' && user.role != 'super_admin') {
        await authDataSource.signOut();
        return const Left(PermissionFailure('Access denied. Admin role required.'));
      }
      
      return Right(user);
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmail({
    required String email,
    required String password,
    required String name,
    String? phoneNumber,
  }) async {
    // Admin sign up should be handled separately
    return const Left(PermissionFailure('Admin registration not allowed through this method'));
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    return const Left(PermissionFailure('Google sign-in not available for admin'));
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await authDataSource.signOut();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final user = await authDataSource.getCurrentUser();
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      await authDataSource.resetPassword(email);
      return const Right(null);
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      await authDataSource.changePassword(currentPassword, newPassword);
      return const Right(null);
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    return await authDataSource.isAuthenticated();
  }

  @override
  Stream<UserEntity?> get userStream => authDataSource.userStream;
}

