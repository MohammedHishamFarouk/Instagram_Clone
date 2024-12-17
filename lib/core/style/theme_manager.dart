import 'package:flutter/material.dart';
import 'package:insgram_clone/core/style/color_manager.dart';

class ThemeManager {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.blackShade,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      backgroundColor: ColorManager.blackShade,
      foregroundColor: Colors.white,
    ),
    listTileTheme: const ListTileThemeData(
      titleTextStyle: TextStyle(color: Colors.white),
      subtitleTextStyle: TextStyle(color: Colors.white),
    ),
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
