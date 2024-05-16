import 'package:flutter/foundation.dart';
import 'package:hotel/domain/services/booking_service.dart';

import '../domain/models/booking_model.dart';

class BookingProvider extends ChangeNotifier {
  final BookingService _bookingService = BookingService();
  // add a booking
  Future<void> addBooking(Booking booking) async {
    try {
      await _bookingService.addBooking(booking);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Error adding booking: $e');
      }
    }
  }

  //get bookings
  Future<List<Booking>> getBookings() async {
    try {
      return await _bookingService.getBookings();
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching bookings: $e');
      }
      return [];
    }
  }

  //update a booking
  Future<void> updateBooking(Booking booking) async {
    try {
      await _bookingService.updateBooking(booking);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Error updating booking: $e');
      }
    }
  }

  //delete a booking
  Future<void> deleteBooking(Booking booking) async {
    try {
      await _bookingService.deleteBooking(booking);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting booking: $e');
      }
    }
  }
}
