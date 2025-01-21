import 'package:flutter/material.dart';
import 'package:insgram_clone/core/style/color_manager.dart';

class ThemeManager {
  static final ThemeData darkTheme = ThemeData(
      primaryColor: Colors.black,
      secondaryHeaderColor: Colors.white,
      scaffoldBackgroundColor: Colors.black,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      brightness: Brightness.dark,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(fontSize: 16, color: Colors.white),
      ),
      listTileTheme: const ListTileThemeData(
        subtitleTextStyle: TextStyle(color: Colors.white),
      ),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.white),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontFamily: "Inter",
          letterSpacing: 0.9,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          overlayColor: Colors.transparent,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.blue,
          overlayColor: Colors.transparent,
        ),
      ),
      tabBarTheme: const TabBarThemeData(
        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        dividerColor: Colors.transparent,
        indicatorColor: Colors.white38,
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.white54,
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      searchBarTheme: SearchBarThemeData(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: const WidgetStatePropertyAll(ColorManager.darkGrey),
        hintStyle: const WidgetStatePropertyAll(
          TextStyle(fontSize: 16, color: ColorManager.grey),
        ),
      ));
}
