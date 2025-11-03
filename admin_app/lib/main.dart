import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';

import 'config/routes/app_router.dart';
import 'config/theme/admin_theme.dart';
import 'core/di/injection.dart' as di;
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await FirebaseService.instance.initialize(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // Initialize core dependencies
  await initializeDependencies();
  
  // Initialize admin app dependencies
  await di.initializeAdminDependencies();
  
  // Initialize notifications
  await NotificationService.instance.initialize();
  
  runApp(const AdminApp());
}

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => di.getIt<AuthBloc>()..add(CheckAuthStatusEvent()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Booking Admin',
        debugShowCheckedModeBanner: false,
        theme: AdminTheme.lightTheme,
        darkTheme: AdminTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: AdminRouter.router,
      ),
    );
  }
}

