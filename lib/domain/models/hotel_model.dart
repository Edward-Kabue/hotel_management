import 'package:hotel/domain/models/room_model.dart';

class Hotel {
  final String name;
  final String location;
  final double rating;
  final String imageUrl;
  final List<Room> rooms;

  Hotel({
    required this.name,
    required this.location,
    required this.rating,
    required this.imageUrl,
    required this.rooms,
  });
}
