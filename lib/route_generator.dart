import 'package:flutter/material.dart';
import 'package:insgram_clone/view/auth/login_screen.dart';
import 'package:insgram_clone/view/auth/register_screen.dart';
import 'package:insgram_clone/view/auth/switch_account_screen.dart';
import 'package:insgram_clone/view/navigationBar/bottom_navigationbar_screen.dart';
import 'package:insgram_clone/view/navigationBar/directMessages/message_screen.dart';
import 'package:insgram_clone/view/navigationBar/profile/editProfile/edit_profile_screen.dart';
import 'package:insgram_clone/view/navigationBar/profile/settings_screen.dart';
import 'package:insgram_clone/view/start_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/start':
        return SlideRightRoute(page: const StartScreen());
      case '/switchAccount':
        return SlideRightRoute(page: const SwitchAccountScreen());
      case '/login':
        return SlideRightRoute(page: const LoginScreen());
      case '/register':
        return SlideRightRoute(page: const RegisterScreen());
      case '/navigationScreen':
        return SlideRightRoute(page: const BottomNavigationBarScreen());
      case '/messages':
        return SlideRightRoute(page: const MessagesScreen());
      case '/editProfile':
        return SlideRightRoute(page: const EditProfileScreen());
      case '/settings':
        return SlideRightRoute(page: const SettingsScreen());
      default:
        return SlideRightRoute(page: const StartScreen());
    }
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}
