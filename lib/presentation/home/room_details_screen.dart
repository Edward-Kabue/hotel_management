import 'package:flutter/material.dart';
import 'package:hotel/domain/models/room_model.dart';

class RoomDetailsScreen extends StatelessWidget {
  final Room room;

  const RoomDetailsScreen({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Room Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Room Type: ${room.type}',
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text('Rate: \$${room.rate.toStringAsFixed(2)}'),
            const SizedBox(height: 8.0),
            Text(
                'Availability: ${room.isAvailable ? 'Available' : 'Not Available'}'),
            // Add more details about the room here
          ],
        ),
      ),
    );
  }
}
