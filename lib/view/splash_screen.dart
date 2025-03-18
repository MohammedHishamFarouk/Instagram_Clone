import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/modelView/authentication/auth_cubit.dart';
import 'package:insgram_clone/modelView/themeManager/theme_manager_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthCubit>().checkForUser();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        final navigator = Navigator.of(context);
        if (state is UserPresent) {
          context.read<ThemeManagerCubit>().loadTheme(context);
          Future.delayed(const Duration(seconds: 2), () {
            navigator.pushReplacementNamed('/navigationScreen');
          });
        } else if (state is UserLoggedOut) {
          Future.delayed(const Duration(seconds: 2), () {
            navigator.pushReplacementNamed('/login');
          });
        } else if (state is SignUpSuccess) {
          log('sign up success');
        }
      },
      child: const Scaffold(
        body: Center(
          child: Image(
            image: AssetImage('assets/instagram logo.png'),
            height: 150,
          ),
        ),
      ),
    );
  }
}
