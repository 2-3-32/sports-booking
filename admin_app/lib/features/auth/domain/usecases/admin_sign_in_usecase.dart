import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

class AdminSignInUseCase {
  final AuthRepository repository;

  AdminSignInUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
  }) async {
    return await repository.signInWithEmail(
      email: email,
      password: password,
    );
  }
}

