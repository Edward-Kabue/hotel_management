import 'package:hotel/domain/models/room_model.dart';
import 'package:hotel/domain/models/user_model.dart';

class Booking {
  final String? id;
  final String hotelName;
  final List room;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int numberOfGuests;
  final double totalCost;
  final UserModel user;

  Booking({
    this.id,
    required this.hotelName,
    required this.room,
    required this.checkInDate,
    required this.checkOutDate,
    required this.numberOfGuests,
    required this.totalCost,
    required this.user,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hotelName': hotelName,
      'room': room.map((e) => e.toJson()).toList(),
      'checkInDate': checkInDate.toIso8601String(),
      'checkOutDate': checkOutDate.toIso8601String(),
      'numberOfGuests': numberOfGuests,
      'totalCost': totalCost,
      'user': user.toJson(),
    };
  }

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      hotelName: json['hotelName'],
      room: json['room'].map((e) => Room.fromJson(e)).toList(),
      checkInDate: DateTime.parse(json['checkInDate']),
      checkOutDate: DateTime.parse(json['checkOutDate']),
      numberOfGuests: json['numberOfGuests'],
      totalCost: json['totalCost'],
      user: UserModel.fromJson(json['user']),
    );
  }
}
