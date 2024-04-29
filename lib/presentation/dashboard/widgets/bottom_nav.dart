import 'package:flutter/material.dart';
import 'package:hotel/presentation/dashboard/add_hotels_screen.dart';

class BottomNavAdmin extends StatefulWidget {
  const BottomNavAdmin({super.key});
  @override
  State<BottomNavAdmin> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNavAdmin> {
  int _selectedIndex = 0;

  List pages = [
    const AddHotelScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
