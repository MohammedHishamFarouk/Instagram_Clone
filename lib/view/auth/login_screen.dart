import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/modelView/authentication/auth_cubit.dart';
import 'package:insgram_clone/view/auth/components/auth_button.dart';
import 'package:insgram_clone/view/core/components/custom_icons.dart';
import 'package:insgram_clone/view/core/components/custom_text_field.dart';
import 'package:insgram_clone/view/core/constants/assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool obscureText = true;
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is SignInSuccess || current is SignInFailure,
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/start',
            (Route<dynamic> route) => false,
          );
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 18),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 65.0),
                        child: Text(
                          'Instagram',
                          style: TextStyle(
                            fontSize: 50,
                            fontFamily: 'LobsterTwo',
                          ),
                        ),
                      ),
                      CustomTextField(
                        hintText: 'Email',
                        controller: context.read<AuthCubit>().signInEmail,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: BlocBuilder<AuthCubit, AuthState>(
                          buildWhen: (previous, current) =>
                              current is PasswordObscured,
                          builder: (context, state) {
                            return CustomTextField(
                              hintText: 'Password',
                              controller:
                                  context.read<AuthCubit>().signInPassword,
                              obscureText: obscureText,
                              addSuffixIcon: true,
                              suffixIcon: Icon(
                                Icons.remove_red_eye_rounded,
                                color: Colors.grey.shade700,
                              ),
                              onSuffixTapped: () {
                                obscureText = !obscureText;
                                context.read<AuthCubit>().toggleObscureText();
                              },
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25.0),
                            child: state is SignInLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.blue,
                                    ),
                                  )
                                : AuthButton(
                                    register: false,
                                    onPressed: () =>
                                        context.read<AuthCubit>().signIn(),
                                  ),
                          );
                        },
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomSvgIcon(
                              assetName: Assets.facebookSVG,
                              width: 17,
                              height: 17,
                            ),
                            SizedBox(width: 5),
                            Text('Log in with Facebook'),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(thickness: 0.2),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                'OR',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(thickness: 0.2),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/register'),
                            child: const Text(
                              'Sign up.',
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 15,
                  children: [
                    const Divider(
                      thickness: 0.1,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.paddingOf(context).bottom,
                      ),
                      child: const Text(
                        'Instagram from Facebook',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
