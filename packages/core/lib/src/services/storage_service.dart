import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import '../error/exceptions.dart';

/// Storage service for Firebase Storage operations
class StorageService {
  final FirebaseStorage _storage;

  StorageService(this._storage);

  /// Upload file to Firebase Storage
  Future<String> uploadFile({
    required String filePath,
    required String storagePath,
    Function(double)? onProgress,
  }) async {
    try {
      final file = File(filePath);
      
      if (!await file.exists()) {
        throw ValidationException('File does not exist');
      }

      final ref = _storage.ref().child(storagePath);
      final uploadTask = ref.putFile(file);

      // Listen to upload progress
      if (onProgress != null) {
        uploadTask.snapshotEvents.listen((snapshot) {
          final progress = snapshot.bytesTransferred / snapshot.totalBytes;
          onProgress(progress);
        });
      }

      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } on FirebaseException catch (e) {
      throw ServerException('Upload failed: ${e.message}', e.code);
    } catch (e) {
      throw ServerException('Upload failed: $e');
    }
  }

  /// Upload multiple files
  Future<List<String>> uploadMultipleFiles({
    required List<String> filePaths,
    required String storageDirectory,
    Function(int, double)? onProgress,
  }) async {
    final urls = <String>[];

    for (var i = 0; i < filePaths.length; i++) {
      final filePath = filePaths[i];
      final fileName = filePath.split('/').last;
      final storagePath = '$storageDirectory/$fileName';

      final url = await uploadFile(
        filePath: filePath,
        storagePath: storagePath,
        onProgress: (progress) {
          if (onProgress != null) {
            onProgress(i, progress);
          }
        },
      );

      urls.add(url);
    }

    return urls;
  }

  /// Delete file from Firebase Storage
  Future<void> deleteFile(String storagePath) async {
    try {
      final ref = _storage.ref().child(storagePath);
      await ref.delete();
    } on FirebaseException catch (e) {
      throw ServerException('Delete failed: ${e.message}', e.code);
    }
  }

  /// Delete file by URL
  Future<void> deleteFileByUrl(String url) async {
    try {
      final ref = _storage.refFromURL(url);
      await ref.delete();
    } on FirebaseException catch (e) {
      throw ServerException('Delete failed: ${e.message}', e.code);
    }
  }

  /// Get download URL
  Future<String> getDownloadUrl(String storagePath) async {
    try {
      final ref = _storage.ref().child(storagePath);
      return await ref.getDownloadURL();
    } on FirebaseException catch (e) {
      throw ServerException('Failed to get download URL: ${e.message}', e.code);
    }
  }

  /// List files in directory
  Future<List<String>> listFiles(String directory) async {
    try {
      final ref = _storage.ref().child(directory);
      final result = await ref.listAll();
      
      final urls = <String>[];
      for (final item in result.items) {
        final url = await item.getDownloadURL();
        urls.add(url);
      }

      return urls;
    } on FirebaseException catch (e) {
      throw ServerException('Failed to list files: ${e.message}', e.code);
    }
  }

  /// Get file metadata
  Future<FullMetadata> getMetadata(String storagePath) async {
    try {
      final ref = _storage.ref().child(storagePath);
      return await ref.getMetadata();
    } on FirebaseException catch (e) {
      throw ServerException('Failed to get metadata: ${e.message}', e.code);
    }
  }
}

