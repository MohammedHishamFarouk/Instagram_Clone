import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
        fontFamily: "Inter",
        letterSpacing: 0.9,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
          foregroundColor: Colors.white, overlayColor: Colors.transparent),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: Colors.blue, overlayColor: Colors.transparent),
    ),
  );
}
