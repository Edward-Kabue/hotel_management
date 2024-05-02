import 'package:flutter/material.dart';
import 'package:hotel/presentation/home/hotel_rooms_screen.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../domain/models/user_model.dart';
import '../../providers/hotel_provider.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final UserModel? user;

  const MyHomePage({required this.title, Key? key, this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HotelProvider()..fetchHotels(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(title),
          centerTitle: true,
        ),
        body: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                clipBehavior: Clip.hardEdge,
                aspectRatio: 16 / 9,
                height: 200.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: [
                'assets/carousel/img1.png',
                'assets/carousel/img2.png',
                'assets/carousel/img3.png',
              ].map((imageAsset) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.asset(
                        imageAsset,
                        fit: BoxFit.fitWidth,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: Consumer<HotelProvider>(
                builder: (context, provider, child) {
                  if (provider.hotels.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    padding: const EdgeInsets.all(16.0),
                    itemCount: provider.hotels.length,
                    itemBuilder: (context, index) {
                      final hotel = provider.hotels[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HotelRoomsScreen(hotel: hotel),
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
          ],
        ),
      ),
    );
  }
}
