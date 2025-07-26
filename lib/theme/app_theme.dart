import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Color(0xFF1B2A4B),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
  );
}

//App Colors
class AppColors {
  static const Color primary = Color(0xFF0A1F44);
  static const Color secondary = Color(0xFFF9D6D6);
  static const Color text = Colors.white;
  static const Color blue = Colors.blue;
  //static const Color darkText = Color(0xFF333333);
  static const Color background = Color(0xFF1B2A4B);
}

//App Fonts
class AppFonts {
  static const TextStyle headline = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );
  static const TextStyle headline2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );
  static const TextStyle body = TextStyle(fontSize: 18, color: AppColors.text);

  static const TextStyle caption = TextStyle(
    fontSize: 15,
    //fontWeight: FontWeight.bold,
    color: AppColors.text,
  );
}
