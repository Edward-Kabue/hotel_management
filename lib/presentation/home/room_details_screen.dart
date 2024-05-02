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
        child: SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.blueAccent,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize
                    .min, // This will make the Card fit its content vertically
                children: [
                  Text(
                    'Room Type: ${room.type}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text('Rate: \$${room.rate.toStringAsFixed(2)}'),
                  const SizedBox(height: 8.0),
                  Text(
                    'Availability: ${room.isAvailable ? 'Available' : 'Not Available'}',
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: room.isAvailable
                        ? () {
                            // Handle "Book Now" button press
                          }
                        : null,
                    child: const Text('Book Now'),
                  ),
                  // Add more details about the room here
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
