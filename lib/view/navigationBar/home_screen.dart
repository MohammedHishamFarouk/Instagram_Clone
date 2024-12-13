import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Instagram',
          style: TextStyle(fontFamily: 'LobsterTwo', fontSize: 28),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 98,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(20, 8.5, 0, 8.5),
              itemBuilder: (context, index) {
                return const Column(
                  children: [
                    CircleAvatar(
                      radius: 31,
                      backgroundImage:
                          AssetImage('assets/deblured-cutty-fox.jpg'),
                    ),
                    Text(
                      'mohammed',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
              itemCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
