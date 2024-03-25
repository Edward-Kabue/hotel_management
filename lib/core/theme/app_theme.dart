import 'package:hotel/core/theme/color_pallet.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
        primaryColor: AppPallet.primaryColor,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: AppPallet.accentColor,
            ),
        scaffoldBackgroundColor: AppPallet.accentColorLightest3,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
            color: AppPallet.accentColorLightest,
          ),
          displaySmall: TextStyle(
            fontSize: 36.0,
            fontStyle: FontStyle.italic,
            color: AppPallet.accentColorLightest,
          ),
          titleSmall: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Hind',
            color: AppPallet.accentColorLightest,
          ),
        ),
      );
}
