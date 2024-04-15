import 'package:flutter/material.dart';
import 'package:hotel/presentation/authentication/screens/signUp_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hotel/presentation/home/home_screen.dart';
import 'package:hotel/presentation/onboarding/onboarding_screen.dart';
import 'package:hotel/providers/navigation_provider.dart';
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
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        // Add more providers here if needed
      ],
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
      home: authProvider.isLoggedIn
          ? const ProfileScreen()
          : const OnboardingScreen(),
      //if user is logged in redirect to home page
      /// Generates the appropriate route based on the provided [settings].
      ///
      /// The [settings] parameter contains information about the requested route,
      /// such as the route name. This function uses a switch statement to determine
      /// which route to generate and returns a [MaterialPageRoute] with the
      /// corresponding builder.
      ///
      /// If the route name is '/login', it returns a [MaterialPageRoute] with the
      /// [LoginScreen] as the builder. If the route name is '/signUp', it returns
      /// a [MaterialPageRoute] with the [SignUpScreen] as the builder. If the route
      /// name is '/profile', it returns a [MaterialPageRoute] with the [ProfileScreen]
      /// as the builder. For any other route name, it returns a [MaterialPageRoute]
      /// with the [MyHomePage] as the builder, with the title set to 'Hotel Page'.
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            );
          case '/signUp':
            return MaterialPageRoute(
              builder: (context) => const SignUpScreen(),
            );
          case '/profile':
            return MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const MyHomePage(title: 'Hotel Page'),
            );
        }
      },
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/home': (context) => const MyHomePage(title: 'Hotel Page'),
        '/signUp': (context) => const SignUpScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
