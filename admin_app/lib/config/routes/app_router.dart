import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/admin_login_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/bookings/presentation/pages/admin_bookings_page.dart';
import '../../features/bookings/presentation/pages/admin_booking_detail_page.dart';
import '../../features/users/presentation/pages/users_page.dart';
import '../../features/users/presentation/pages/user_detail_page.dart';
import '../../features/analytics/presentation/pages/analytics_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/splash/presentation/pages/admin_splash_page.dart';

class AdminRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    routes: [
      // Splash
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const AdminSplashPage(),
      ),
      
      // Auth
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const AdminLoginPage(),
      ),
      
      // Dashboard
      GoRoute(
        path: '/dashboard',
        name: 'dashboard',
        builder: (context, state) => const DashboardPage(),
      ),
      
      // Bookings
      GoRoute(
        path: '/bookings',
        name: 'bookings',
        builder: (context, state) => const AdminBookingsPage(),
      ),
      GoRoute(
        path: '/bookings/:id',
        name: 'booking-detail',
        builder: (context, state) {
          final bookingId = state.pathParameters['id']!;
          return AdminBookingDetailPage(bookingId: bookingId);
        },
      ),
      
      // Users
      GoRoute(
        path: '/users',
        name: 'users',
        builder: (context, state) => const UsersPage(),
      ),
      GoRoute(
        path: '/users/:id',
        name: 'user-detail',
        builder: (context, state) {
          final userId = state.pathParameters['id']!;
          return UserDetailPage(userId: userId);
        },
      ),
      
      // Analytics
      GoRoute(
        path: '/analytics',
        name: 'analytics',
        builder: (context, state) => const AnalyticsPage(),
      ),
      
      // Settings
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.uri}'),
      ),
    ),
  );
}

