import 'package:flutter/material.dart';
import 'package:insgram_clone/core/components/custom_textfield_widget.dart';
import 'package:insgram_clone/view/auth/components/login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 18),
                child: IconButton(
                  onPressed: () {},
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
                    const CustomTextFieldWidget(hintText: 'Email'),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: CustomTextFieldWidget(hintText: 'Password'),
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
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      child: LoginButtonWidget(),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/icons/facebook_icon.png'),
                            height: 17,
                            width: 17,
                          ),
                          SizedBox(width: 5),
                          Text('Log in with Facebook'),
                        ],
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
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
                          onPressed: () {},
                          child: const Text(
                            'Sign up.',
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Divider(
                      thickness: 0.05,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
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
    );
  }
}
