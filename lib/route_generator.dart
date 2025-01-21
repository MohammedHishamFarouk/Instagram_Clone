import 'package:flutter/material.dart';
import 'package:insgram_clone/view/auth/login_screen.dart';
import 'package:insgram_clone/view/auth/start_screen.dart';
import 'package:insgram_clone/view/navigationBar/bottom_navigationbar_screen.dart';
import 'package:insgram_clone/view/navigationBar/directMessages/message_screen.dart';
import 'package:insgram_clone/view/navigationBar/home/home_screen.dart';
import 'package:insgram_clone/view/navigationBar/profile/editProfile/edit_profile_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/start':
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/messages':
        return MaterialPageRoute(builder: (_) => const MessagesScreen());
      case '/editProfile':
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => const BottomNavigationBarScreen());
    }
  }
}
