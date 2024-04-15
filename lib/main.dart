import 'package:flutter/material.dart';
import 'package:hotel/presentation/authentication/screens/signUp_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hotel/presentation/home/home_screen.dart';
import 'core/theme/theme.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:hotel/providers/auth_provider.dart';
import 'presentation/authentication/screens/login_screen.dart';
import 'presentation/home/profile_screen.dart';

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
    final authProvider = Provider.of<AuthProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Card',
      theme: AppTheme.theme,
      //if user is not logged in redirect to login page
      home: authProvider.isLoggedIn
          ? const MyHomePage(title: 'Hotel Page')
          : const SignUpScreen(),
      routes: {
        '/home': (context) => const MyHomePage(title: 'Hotel Page'),
        '/signUp': (context) => const SignUpScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
