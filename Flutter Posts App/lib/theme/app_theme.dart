import 'package:flutter/material.dart';

class AppTheme {
  static const Color pureWhite = Colors.white;
  static const Color pureBlack = Colors.black;

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: pureWhite,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: pureBlack,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: pureBlack),
    ),
    colorScheme: const ColorScheme.light(
      primary: pureBlack,
      onPrimary: pureWhite,
      surface: pureWhite,
      onSurface: pureBlack,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: pureBlack,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: pureWhite,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: pureWhite),
    ),
    colorScheme: const ColorScheme.dark(
      primary: pureWhite,
      onPrimary: pureBlack,
      surface: pureBlack,
      onSurface: pureWhite,
    ),
  );
}
