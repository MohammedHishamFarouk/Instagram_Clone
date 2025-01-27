import 'package:flutter/material.dart';
import 'package:insgram_clone/view/auth/login_screen.dart';
import 'package:insgram_clone/view/auth/start_screen.dart';
import 'package:insgram_clone/view/navigationBar/bottom_navigationbar_screen.dart';
import 'package:insgram_clone/view/navigationBar/directMessages/message_screen.dart';
import 'package:insgram_clone/view/navigationBar/profile/editProfile/edit_profile_screen.dart';
import 'package:insgram_clone/view/start_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/start':
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case '/switchAccount':
        return MaterialPageRoute(builder: (_) => const SwitchAccountScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/navigationScreen':
        return MaterialPageRoute(
            builder: (_) => const BottomNavigationBarScreen());
      case '/messages':
        return MaterialPageRoute(builder: (_) => const MessagesScreen());
      case '/editProfile':
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
