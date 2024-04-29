import 'package:flutter/material.dart';
import 'package:hotel/domain/models/hotel_model.dart';
import 'package:hotel/domain/models/room_model.dart';
import 'package:hotel/presentation/home/hotel_rooms_screen.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final List<Hotel> hotels = [
    Hotel(
      name: 'Grand Hyatt',
      location: 'New York, USA',
      rating: 4.8,
      imageUrl:
          'https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
      rooms: [
        Room(type: 'Standard', rate: 150.0, isAvailable: true),
        Room(type: 'Deluxe', rate: 250.0, isAvailable: false),
        Room(type: 'Suite', rate: 400.0, isAvailable: true),
      ],
    ),
    Hotel(
      name: 'Ritz-Carlton',
      location: 'Dubai, UAE',
      rating: 4.9,
      imageUrl:
          'https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
      rooms: [
        Room(type: 'Classic', rate: 300.0, isAvailable: true),
        Room(type: 'Executive', rate: 450.0, isAvailable: true),
        Room(type: 'Presidential', rate: 800.0, isAvailable: false),
      ],
    ),
    // Add more hotels with rooms as needed
  ];

  MyHomePage({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(title),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          return GestureDetector(
            onTap: () {
              // Navigate to the room details screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HotelRoomsScreen(hotel: hotel),
                ),
              );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      hotel.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hotel.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          hotel.location,
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              hotel.rating.toString(),
                              style: const TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
