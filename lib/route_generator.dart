import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/modelView/themeManager/theme_manager_cubit.dart';
import 'package:insgram_clone/view/auth/login_screen.dart';
import 'package:insgram_clone/view/auth/register_screen.dart';
import 'package:insgram_clone/view/auth/switch_account_screen.dart';
import 'package:insgram_clone/view/navigationBar/bottom_navigationbar_screen.dart';
import 'package:insgram_clone/view/navigationBar/directMessages/message_screen.dart';
import 'package:insgram_clone/view/navigationBar/profile/editProfile/edit_profile_screen.dart';
import 'package:insgram_clone/view/navigationBar/profile/settings_screen.dart';
import 'package:insgram_clone/view/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/start':
        return _SlideRightRoute(page: const SplashScreen());
      case '/switchAccount':
        return _SlideRightRoute(page: const SwitchAccountScreen());
      case '/login':
        return _SlideRightRoute(page: const LoginScreen());
      case '/register':
        return _SlideRightRoute(page: const RegisterScreen());
      case '/navigationScreen':
        return _SlideRightRoute(page: const BottomNavigationBarScreen());
      case '/messages':
        return _SlideRightRoute(page: const MessagesScreen());
      case '/editProfile':
        return _SlideRightRoute(page: const EditProfileScreen());
      case '/settings':
        return _SlideRightRoute(page: const SettingsScreen());
      default:
        return _SlideRightRoute(page: const SplashScreen(),);
    }
  }
}

class _SlideRightRoute extends PageRouteBuilder {
  final Widget page;

  _SlideRightRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final begin = context
          .read<ThemeManagerCubit>()
          .isEnglish
          ? const Offset(-1.0, 0.0)
          : const Offset(1.0, 0.0);
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
