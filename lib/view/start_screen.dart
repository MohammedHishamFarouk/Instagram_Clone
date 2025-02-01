import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/modelView/authentication/auth_cubit.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushReplacementNamed(context, '/navigationScreen');
          });
        } else if (state is SignInFailure) {
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushReplacementNamed(context, '/login');
          });
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
