import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/booking_model.dart';

class BookingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//get bookings
  Future<List<Booking>> getBookings() async {
    QuerySnapshot snapshot = await _firestore.collection('bookings').get();
    return snapshot.docs
        .map((doc) => Booking.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  //add a new booking
  Future<void> addBooking(Booking booking) async {
    await _firestore.collection('bookings').add(booking.toJson());
  }

  //update a booking
  Future<void> updateBooking(Booking booking) async {
    await _firestore
        .collection('bookings')
        .doc(booking.id.toString())
        .update(booking.toJson());
  }

  //delete a booking
  Future<void> deleteBooking(booking) async {
    await _firestore.collection('bookings').doc(booking.id.toString()).delete();
  }
}
