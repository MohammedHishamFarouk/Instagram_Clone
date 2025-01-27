import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/modelView/authentication/auth_cubit.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return FilledButton(
            onPressed:
                context.read<AuthCubit>().signInPassword.text.length < 8 ||
                        context.read<AuthCubit>().signInEmail.text.length < 8
                    ? null
                    : onPressed,
            style: FilledButton.styleFrom(
              disabledBackgroundColor: Colors.blue.withOpacity(0.5),
              disabledForegroundColor: Colors.white.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text('Log in'),
          );
        },
      ),
    );
  }
}
