import 'package:cloud_firestore/cloud_firestore.dart';
//import the hotel model from the hotel_model.dart file in the models folder
import '../models/hotel_model.dart';

//class to handle the hotel data
//This would be some what similar to controllers in express.js
class HotelService {
  //initialize the Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//get the hotels from the Firestore database
  Future<List<Hotel>> getHotels() async {
    QuerySnapshot snapshot = await _firestore.collection('hotels').get();
    return snapshot.docs
        .map((doc) => Hotel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

//add a new hotel to the Firestore database
  Future<void> addHotel(Hotel hotel) async {
    await _firestore.collection('hotels').add(hotel.toJson());
  }

//update a hotel in the Firestore database by passing the hotel object with a matching id
  Future<void> updateHotel(Hotel hotel) async {
    await _firestore
        .collection('hotels')
        .doc(hotel.id.toString())
        .update(hotel.toJson());
  }

  //delete a hotel from the Firestore database by passing the hotel id
  Future<void> deleteHotel(hotel) async {
    await _firestore.collection('hotels').doc(hotel.id.toString()).delete();
  }

//set the hotels in the Firestore database by passing a list of hotels
//similar to seeding a db in Laravel using a factory class
  Future<void> setHotels(List<Hotel> hotels) async {
    // Clear existing data
    QuerySnapshot snapshot = await _firestore.collection('hotels').get();
    for (DocumentSnapshot doc in snapshot.docs) {
      await doc.reference.delete();
    }

    // Add dummy data
    for (Hotel hotel in hotels) {
      await _firestore.collection('hotels').add(hotel.toJson());
    }
  }
}
