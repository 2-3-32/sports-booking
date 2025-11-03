import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

class AdminSignOutUseCase {
  final AuthRepository repository;

  AdminSignOutUseCase(this.repository);

  Future<Either<Failure, void>> call() async {
    return await repository.signOut();
  }
}

