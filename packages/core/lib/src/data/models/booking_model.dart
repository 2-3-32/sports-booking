import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/booking_entity.dart';

/// Booking model
class BookingModel extends BookingEntity {
  const BookingModel({
    required super.id,
    required super.userId,
    required super.userName,
    super.userPhone,
    required super.serviceId,
    required super.serviceName,
    super.serviceDescription,
    required super.price,
    required super.bookingDate,
    required super.bookingTime,
    required super.status,
    super.notes,
    required super.createdAt,
    super.updatedAt,
    super.cancelledBy,
    super.cancellationReason,
  });

  /// Convert from entity
  factory BookingModel.fromEntity(BookingEntity entity) {
    return BookingModel(
      id: entity.id,
      userId: entity.userId,
      userName: entity.userName,
      userPhone: entity.userPhone,
      serviceId: entity.serviceId,
      serviceName: entity.serviceName,
      serviceDescription: entity.serviceDescription,
      price: entity.price,
      bookingDate: entity.bookingDate,
      bookingTime: entity.bookingTime,
      status: entity.status,
      notes: entity.notes,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      cancelledBy: entity.cancelledBy,
      cancellationReason: entity.cancellationReason,
    );
  }

  /// Convert from Firestore document
  factory BookingModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    
    return BookingModel(
      id: doc.id,
      userId: data['userId'] ?? '',
      userName: data['userName'] ?? '',
      userPhone: data['userPhone'],
      serviceId: data['serviceId'] ?? '',
      serviceName: data['serviceName'] ?? '',
      serviceDescription: data['serviceDescription'],
      price: (data['price'] ?? 0.0).toDouble(),
      bookingDate: (data['bookingDate'] as Timestamp).toDate(),
      bookingTime: data['bookingTime'] ?? '',
      status: data['status'] ?? 'pending',
      notes: data['notes'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: data['updatedAt'] != null 
          ? (data['updatedAt'] as Timestamp).toDate() 
          : null,
      cancelledBy: data['cancelledBy'],
      cancellationReason: data['cancellationReason'],
    );
  }

  /// Convert to Firestore map
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'userName': userName,
      'userPhone': userPhone,
      'serviceId': serviceId,
      'serviceName': serviceName,
      'serviceDescription': serviceDescription,
      'price': price,
      'bookingDate': Timestamp.fromDate(bookingDate),
      'bookingTime': bookingTime,
      'status': status,
      'notes': notes,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
      'cancelledBy': cancelledBy,
      'cancellationReason': cancellationReason,
    };
  }

  /// Copy with
  BookingModel copyWith({
    String? id,
    String? userId,
    String? userName,
    String? userPhone,
    String? serviceId,
    String? serviceName,
    String? serviceDescription,
    double? price,
    DateTime? bookingDate,
    String? bookingTime,
    String? status,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? cancelledBy,
    String? cancellationReason,
  }) {
    return BookingModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userPhone: userPhone ?? this.userPhone,
      serviceId: serviceId ?? this.serviceId,
      serviceName: serviceName ?? this.serviceName,
      serviceDescription: serviceDescription ?? this.serviceDescription,
      price: price ?? this.price,
      bookingDate: bookingDate ?? this.bookingDate,
      bookingTime: bookingTime ?? this.bookingTime,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      cancelledBy: cancelledBy ?? this.cancelledBy,
      cancellationReason: cancellationReason ?? this.cancellationReason,
    );
  }
}

