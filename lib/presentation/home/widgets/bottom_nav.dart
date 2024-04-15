import 'package:flutter/material.dart';
import 'package:hotel/presentation/home/home_screen.dart';
import 'package:hotel/presentation/home/profile_screen.dart';
import 'package:hotel/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key});
  final List<Widget> _screens = [
    const MyHomePage(title: 'Hotel Page'),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNav = Provider.of<NavigationProvider>(context);
    return Scaffold(
      body: _screens[bottomNav.currentIndex],
      bottomNavigationBar: Consumer<NavigationProvider>(
        builder: (context, provider, _) {
          return BottomNavigationBar(
            currentIndex: provider.currentIndex,
            onTap: (index) {
              provider.updateIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
