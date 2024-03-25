import 'package:flutter/material.dart';

void main() => runApp(const Hotel());

class Hotel extends StatelessWidget {
  const Hotel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Card',
      theme: ThemeData(primarySwatch: Colors.blue),
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
