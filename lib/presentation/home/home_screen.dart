import 'package:flutter/material.dart';
import 'package:hotel/presentation/home/hotel_rooms_screen.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../domain/models/user_model.dart';
import '../../providers/hotel_provider.dart';

class MyHomePage extends StatelessWidget {
  final pageController = PageController();

  final String title;
  final UserModel? user;

  MyHomePage({required this.title, super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HotelProvider()..fetchHotels(),
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                        "https://e7.pngegg.com/pngimages/84/165/png-clipart-united-states-avatar-organization-information-user-avatar-service-computer-wallpaper-thumbnail.png",
                        fit: BoxFit.cover),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Text(
                        'Welcome ${user?.displayName ?? ' '}',
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Icon(
                      Icons.search_off_rounded,
                      color: Color(0xff212435),
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              padding: const EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.zero,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(0),
                            padding: const EdgeInsets.all(8),
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Color(0xffffc6e0),
                              shape: BoxShape.circle,
                            ),
                            child: const ImageIcon(
                              NetworkImage(
                                  "https://cdn1.iconfinder.com/data/icons/basi-icon-set-01/100/Fin_copy-37-256.png"),
                              size: 24,
                              color: Color.fromARGB(255, 44, 179, 224),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: Text(
                              "Cities",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                    "https://media.istockphoto.com/id/1299026534/photo/nairobi-kenya.jpg?s=612x612&w=0&k=20&c=xwCQ441cTHFBTZpb8ihvVwqqtTZjmees1C3xdJc_nfw=",
                                    fit: BoxFit.cover),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  "Nairobi",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                    "https://media.istockphoto.com/id/1299026534/photo/nairobi-kenya.jpg?s=612x612&w=0&k=20&c=xwCQ441cTHFBTZpb8ihvVwqqtTZjmees1C3xdJc_nfw=",
                                    fit: BoxFit.cover),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  "Kisumu",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                    "https://media.istockphoto.com/id/1299026534/photo/nairobi-kenya.jpg?s=612x612&w=0&k=20&c=xwCQ441cTHFBTZpb8ihvVwqqtTZjmees1C3xdJc_nfw=",
                                    fit: BoxFit.cover),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  "Mombasa",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                    "https://media.istockphoto.com/id/1299026534/photo/nairobi-kenya.jpg?s=612x612&w=0&k=20&c=xwCQ441cTHFBTZpb8ihvVwqqtTZjmees1C3xdJc_nfw=",
                                    fit: BoxFit.cover),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  "Nyali",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                    "https://media.istockphoto.com/id/1299026534/photo/nairobi-kenya.jpg?s=612x612&w=0&k=20&c=xwCQ441cTHFBTZpb8ihvVwqqtTZjmees1C3xdJc_nfw=",
                                    fit: BoxFit.cover),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  "Text",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 240,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, position) {
                      List<String> imageUrls = [
                        "https://media.istockphoto.com/id/1193996236/photo/scenic-of-night-urban-cityscape-skyline-and-golden-building-with-twilight-time.jpg?s=2048x2048&w=is&k=20&c=98Eh08jrwH9DQNxx1V7gUOjeEQoJXuX8T7AmVmFy90M=",
                        "https://media.istockphoto.com/id/1193996236/photo/scenic-of-night-urban-cityscape-skyline-and-golden-building-with-twilight-time.jpg?s=2048x2048&w=is&k=20&c=98Eh08jrwH9DQNxx1V7gUOjeEQoJXuX8T7AmVmFy90M=",
                        "https://media.istockphoto.com/id/1193996236/photo/scenic-of-night-urban-cityscape-skyline-and-golden-building-with-twilight-time.jpg?s=2048x2048&w=is&k=20&c=98Eh08jrwH9DQNxx1V7gUOjeEQoJXuX8T7AmVmFy90M=",
                      ];
                      return Align(
                        alignment: Alignment.topCenter,
                        child: Image.network(
                          imageUrls[
                              position], // Use the URL at the current position
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        axisDirection: Axis.horizontal,
                        effect: const ExpandingDotsEffect(
                          dotColor: Color(0xff9e9e9e),
                          activeDotColor: Color(0xff3a57e8),
                          dotHeight: 10,
                          dotWidth: 10,
                          radius: 16,
                          spacing: 8,
                          expansionFactor: 3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
