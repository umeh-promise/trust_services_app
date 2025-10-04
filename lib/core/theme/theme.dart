import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/colors.dart';
import 'package:trust_services_app/core/theme/sizes.dart';

class AppTheme {
  static _border([color = AppPallete.transparentColor]) => OutlineInputBorder(
    borderSide: BorderSide(width: 1, color: color),
    borderRadius: BorderRadius.circular(10),
  );

  static final theme = ThemeData(
    scaffoldBackgroundColor: AppPallete.whiteColor,
    appBarTheme: AppBarThemeData(backgroundColor: AppPallete.whiteColor),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 32 / 24,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
      ),
      labelSmall: TextStyle(fontSize: Sizes.base, height: 22 / Sizes.base),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        height: Sizes.md / 14,
      ),
    ),
    fontFamily: 'Geist',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14),
        backgroundColor: AppPallete.primaryColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(Sizes.base),
      filled: true,
      fillColor: AppPallete.grey100,
      border: _border(),
      enabledBorder: _border(),
    ),
  );
}
