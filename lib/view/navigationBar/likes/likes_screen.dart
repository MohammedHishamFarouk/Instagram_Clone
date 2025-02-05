import 'package:flutter/material.dart';
import 'package:insgram_clone/generated/l10n.dart';

class LikesScreen extends StatelessWidget {
  const LikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Text(S.of(context).following),
              ),
              Tab(
                icon: Text(S.of(context).you),
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
