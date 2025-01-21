import 'package:flutter/material.dart';

class LikesScreen extends StatelessWidget {
  const LikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Text('Following'),
              ),
              Tab(
                icon: Text('You'),
              ),
            ],
          ),
        ),
        body: const Column(
          children: [],
        ),
      ),
    );
  }
}
