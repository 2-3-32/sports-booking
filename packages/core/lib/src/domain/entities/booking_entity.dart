import 'package:equatable/equatable.dart';

/// Booking entity
class BookingEntity extends Equatable {
  final String id;
  final String userId;
  final String userName;
  final String? userPhone;
  final String serviceId;
  final String serviceName;
  final String? serviceDescription;
  final double price;
  final DateTime bookingDate;
  final String bookingTime;
  final String status;
  final String? notes;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? cancelledBy;
  final String? cancellationReason;

  const BookingEntity({
    required this.id,
    required this.userId,
    required this.userName,
    this.userPhone,
    required this.serviceId,
    required this.serviceName,
    this.serviceDescription,
    required this.price,
    required this.bookingDate,
    required this.bookingTime,
    required this.status,
    this.notes,
    required this.createdAt,
    this.updatedAt,
    this.cancelledBy,
    this.cancellationReason,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        userName,
        userPhone,
        serviceId,
        serviceName,
        serviceDescription,
        price,
        bookingDate,
        bookingTime,
        status,
        notes,
        createdAt,
        updatedAt,
        cancelledBy,
        cancellationReason,
      ];
}

