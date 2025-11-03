import 'package:get_it/get_it.dart';
import 'package:core/core.dart' as core;

import '../../features/auth/data/repositories/admin_auth_repository_impl.dart';
import '../../features/auth/domain/usecases/admin_sign_in_usecase.dart';
import '../../features/auth/domain/usecases/admin_sign_out_usecase.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

final getIt = GetIt.instance;

/// Initialize admin app-specific dependencies
Future<void> initializeAdminDependencies() async {
  // Repositories
  getIt.registerLazySingleton<core.AuthRepository>(
    () => AdminAuthRepositoryImpl(
      authDataSource: core.getIt<core.FirebaseAuthDataSource>(),
      networkInfo: core.getIt<core.NetworkInfo>(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => AdminSignInUseCase(getIt()));
  getIt.registerLazySingleton(() => AdminSignOutUseCase(getIt()));

  // BLoCs
  getIt.registerFactory(
    () => AuthBloc(
      signInUseCase: getIt(),
      signOutUseCase: getIt(),
    ),
  );
}

