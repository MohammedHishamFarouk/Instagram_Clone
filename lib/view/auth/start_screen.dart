import 'package:flutter/material.dart';
import 'package:insgram_clone/view/auth/components/login_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 3),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 65.0),
                      child: Text(
                        'Instagram',
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'LobsterTwo',
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 42.5,
                      backgroundImage:
                          AssetImage('assets/deblured-cutty-fox.jpg'),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Mohammed',
                      ),
                    ),
                    LoginButtonWidget(
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Switch accounts',
                        ),
                      ),
                    ),
                    const Spacer(flex: 4)
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Divider(
                    thickness: 0.05,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0, top: 10),
                    child: Row(
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
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
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
