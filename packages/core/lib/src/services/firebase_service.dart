import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

/// Firebase service for initialization and configuration
class FirebaseService {
  static FirebaseService? _instance;
  
  FirebaseService._();
  
  static FirebaseService get instance {
    _instance ??= FirebaseService._();
    return _instance!;
  }

  /// Initialize Firebase
  Future<void> initialize({FirebaseOptions? options}) async {
    try {
      await Firebase.initializeApp(options: options);
      await _configureFirebaseMessaging();
    } catch (e) {
      print('⚠️ Firebase initialization failed: $e');
      print('⚠️ Running in demo mode without Firebase');
      // Allow app to continue without Firebase for demo purposes
    }
  }

  /// Configure Firebase Messaging
  Future<void> _configureFirebaseMessaging() async {
    try {
      // Request permission for iOS
      await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      // Get FCM token
      final token = await FirebaseMessaging.instance.getToken();
      print('FCM Token: $token');

      // Listen to token refresh
      FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
        print('FCM Token refreshed: $newToken');
        // TODO: Save token to Firestore
      });
    } catch (e) {
      print('⚠️ Firebase Messaging configuration failed: $e');
    }
  }

  /// Get Firebase Auth instance
  FirebaseAuth get auth => FirebaseAuth.instance;

  /// Get Firestore instance
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  /// Get Firebase Storage instance
  FirebaseStorage get storage => FirebaseStorage.instance;

  /// Get Firebase Messaging instance
  FirebaseMessaging get messaging => FirebaseMessaging.instance;

  /// Configure Firestore settings
  void configureFirestore() {
    firestore.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
  }

  /// Enable Firestore network
  Future<void> enableNetwork() async {
    await firestore.enableNetwork();
  }

  /// Disable Firestore network
  Future<void> disableNetwork() async {
    await firestore.disableNetwork();
  }

  /// Clear Firestore persistence
  Future<void> clearPersistence() async {
    await firestore.clearPersistence();
  }
}

