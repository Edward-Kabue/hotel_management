import 'package:flutter/material.dart';

class CityExplorer extends StatelessWidget {
  const CityExplorer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore by City',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Explore by City'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Explore by City',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CityCard(
                    cityName: 'Nairobi',
                    imageAsset: 'assets/pune.jpg',
                  ),
                  CityCard(
                    cityName: 'Kisumu',
                    imageAsset: 'assets/indore.jpg',
                  ),
                  CityCard(
                    cityName: 'Mombasa',
                    imageAsset: 'assets/goa.jpg',
                  ),
                  CityCard(
                    cityName: 'Nakuru',
                    imageAsset: 'assets/delhi.jpg',
                  ),
                  CityCard(
                    cityName: 'Eldoret',
                    imageAsset: 'assets/mumbai.jpg',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Handle "View All" button press
                  },
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CityCard extends StatelessWidget {
  final String cityName;
  final String imageAsset;

  const CityCard({super.key, required this.cityName, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundImage: AssetImage(imageAsset),
          ),
          const SizedBox(height: 8.0),
          Text(
            cityName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
