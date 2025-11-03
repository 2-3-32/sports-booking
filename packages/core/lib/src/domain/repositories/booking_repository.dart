import 'package:dartz/dartz.dart';
import '../../error/failures.dart';
import '../entities/booking_entity.dart';

/// Booking repository interface
abstract class BookingRepository {
  /// Create a new booking
  Future<Either<Failure, BookingEntity>> createBooking({
    required String userId,
    required String serviceId,
    required DateTime bookingDate,
    required String bookingTime,
    String? notes,
  });

  /// Get booking by ID
  Future<Either<Failure, BookingEntity>> getBookingById(String bookingId);

  /// Get bookings by user ID
  Future<Either<Failure, List<BookingEntity>>> getBookingsByUserId(String userId);

  /// Get all bookings (admin only)
  Future<Either<Failure, List<BookingEntity>>> getAllBookings();

  /// Update booking status
  Future<Either<Failure, BookingEntity>> updateBookingStatus({
    required String bookingId,
    required String status,
  });

  /// Cancel booking
  Future<Either<Failure, BookingEntity>> cancelBooking({
    required String bookingId,
    required String cancelledBy,
    String? reason,
  });

  /// Get bookings by status
  Future<Either<Failure, List<BookingEntity>>> getBookingsByStatus(String status);

  /// Get bookings by date range
  Future<Either<Failure, List<BookingEntity>>> getBookingsByDateRange({
    required DateTime startDate,
    required DateTime endDate,
  });

  /// Get booking stream
  Stream<List<BookingEntity>> getBookingsStream(String userId);
}

