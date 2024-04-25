import 'package:flutter/material.dart';
import 'package:hotel/presentation/home/hotel_rooms_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/hotel_provider.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({required this.title, super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HotelProvider _hotelProvider;

  @override
  void initState() {
    super.initState();
    _hotelProvider = HotelProvider();
    _hotelProvider.fetchHotels();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _hotelProvider,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(widget.title),
          centerTitle: true,
        ),
        // Display a loading spinner while fetching hotels
        //use the consumer widget to listen to changes in the hotel provider
        body: Consumer<HotelProvider>(
          builder: (context, provider, child) {
            if (provider.hotels.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: provider.hotels.length,
              itemBuilder: (context, index) {
                final hotel = provider.hotels[index];
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
            );
          },
        ),
      ),
    );
  }
}
