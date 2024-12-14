import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insgram_clone/core/constants/assets.dart';
import 'package:insgram_clone/view/navigationBar/home/components/story_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontFamily: 'LobsterTwo',
            fontSize: 30,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          icon: SvgPicture.asset(
            Assets.cameraSVG,
            height: 25,
            width: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              Assets.igtvRedCircleSVG,
              height: 25,
              width: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              Assets.messengerSVG,
              height: 20,
              width: 23,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 102,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(20, 8.5, 0, 8.5),
              itemBuilder: (context, index) {
                return const StoryButton();
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
