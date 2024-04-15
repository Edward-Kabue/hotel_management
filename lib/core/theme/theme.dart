import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF1E91B6);
  static const Color secondaryColor = Colors.green;

  static const TextStyle headline1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    color: Colors.black,
  );

  static const LinearGradient gradient = LinearGradient(
    colors: [primaryColor, secondaryColor],
  );
  //button theme to use the linear gradient
  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    foregroundColor: Colors.white, // Text color
    backgroundColor: const Color(0xFF5435FF), // Background color
    side: const BorderSide(color: Colors.transparent), // Border color
  );

  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: elevatedButtonStyle,
  );
  //add the app bar theme
  static const AppBarTheme appBarTheme =
      AppBarTheme(color: primaryColor, centerTitle: true);
  static ThemeData get theme => ThemeData(
        primaryColor: primaryColor,
        textTheme: const TextTheme(
          displayLarge: AppTheme.bodyText1,
          displayMedium: AppTheme.bodyText2,
        ),
        appBarTheme: appBarTheme,
        elevatedButtonTheme: elevatedButtonTheme,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(primaryColor),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(primaryColor),
            overlayColor:
                MaterialStateProperty.all(primaryColor.withOpacity(0.1)),
          ),
        ),
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[300],
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
        ),
      );
}
