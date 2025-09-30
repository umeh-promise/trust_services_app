import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_services_app/core/theme/colors.dart';

class AppTheme {
  static final theme = ThemeData(
    scaffoldBackgroundColor: AppPallete.whiteColor,
    appBarTheme: AppBarThemeData(backgroundColor: AppPallete.whiteColor),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      titleLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14),
        backgroundColor: AppPallete.primaryColor,
      ),
    ),
  );
}
