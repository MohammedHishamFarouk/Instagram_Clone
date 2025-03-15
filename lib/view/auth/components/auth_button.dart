import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/modelView/authentication/auth_cubit.dart';
import 'package:insgram_clone/view/core/style/color_manager.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.onPressed,
    required this.register,
  });

  final VoidCallback? onPressed;
  final bool register;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return FilledButton(
            onPressed: register
                ? context.read<AuthCubit>().signUpPassword.text.length < 8 ||
                        context.read<AuthCubit>().signUpEmail.text.length < 8 ||
                        context.read<AuthCubit>().fullName.text.length < 3 ||
                        context.read<AuthCubit>().userName.text.length < 3
                    ? null
                    : onPressed
                : context.read<AuthCubit>().signInPassword.text.length < 8 ||
                        context.read<AuthCubit>().signInEmail.text.length < 8
                    ? null
                    : onPressed,
            style: FilledButton.styleFrom(
              disabledBackgroundColor: ColorManager.semiTransBlue,
              disabledForegroundColor: ColorManager.semiTransWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(register ? 'Sign Up' : 'Login'),
          );
        },
      ),
    );
  }
}
