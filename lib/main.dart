import 'package:flutter/material.dart';
import 'package:hotel/core/theme/app_theme.dart';

void main() => runApp(const Hotel());

class Hotel extends StatelessWidget {
  const Hotel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Card',
      theme: AppTheme.themeData,
      home: const MyHomePage(title: 'Hotel Page'),
    );
  }
}


class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(child: Text('Hotel Booking Card')),
    );
  }
}
