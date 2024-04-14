import 'package:flutter/material.dart';
import 'package:hotel/presentation/authentication/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:hotel/providers/auth_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const Hotel(),
    ),
  );
}

class Hotel extends StatelessWidget {
  const Hotel({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Card',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SignupScreen(), // Set LoginScreen as the home page
      routes: {
        '/home': (context) => const MyHomePage(title: 'Hotel Page'),
        '/signup': (context) => const SignupScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Hotel Booking Card'),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
            child: const Text('Signup'),
          ),
        ],
      ),
    );
  }
}
