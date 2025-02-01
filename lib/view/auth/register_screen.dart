import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/core/components/custom_textfield_widget.dart';
import 'package:insgram_clone/modelView/authentication/auth_cubit.dart';
import 'package:insgram_clone/view/auth/components/auth_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/navigationScreen',
            (Route<dynamic> route) => false,
          );
        } else if (state is SignUpFailure) {
          log(state.errorMessage);
        }
      },
      builder: (context, state) {
        return SafeArea(
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
                        CustomTextFieldWidget(
                          hintText: 'Email',
                          controller: context.read<AuthCubit>().signUpEmail,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CustomTextFieldWidget(
                            hintText: 'Password',
                            controller:
                                context.read<AuthCubit>().signUpPassword,
                          ),
                        ),
                        CustomTextFieldWidget(
                          hintText: 'Full Name',
                          controller: context.read<AuthCubit>().fullName,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CustomTextFieldWidget(
                            hintText: 'Username',
                            controller: context.read<AuthCubit>().userName,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
                          child: state is SignUpLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                )
                              : AuthButton(
                                  register: true,
                                  onPressed: () =>
                                      context.read<AuthCubit>().signUp(),
                                ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/icons/facebook_icon.png'),
                                height: 17,
                                width: 17,
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
                              "have an account?",
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/login'),
                              child: const Text(
                                'login.',
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
                        thickness: 0.05,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.paddingOf(context).bottom),
                        child: const Text(
                          'Instagram from Facebook',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
