import 'package:equatable/equatable.dart';

/// User entity
class UserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? phoneNumber;
  final String? photoUrl;
  final String role;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isActive;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    this.phoneNumber,
    this.photoUrl,
    required this.role,
    required this.createdAt,
    this.updatedAt,
    this.isActive = true,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        phoneNumber,
        photoUrl,
        role,
        createdAt,
        updatedAt,
        isActive,
      ];
}

