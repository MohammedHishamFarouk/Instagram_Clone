import 'package:flutter/material.dart';
import 'package:insgram_clone/view/core/components/custom_icons.dart';
import 'package:insgram_clone/view/core/components/post.dart';
import 'package:insgram_clone/view/core/components/story_button.dart';
import 'package:insgram_clone/view/core/constants/assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = const [
      StoryButton(),
      StoryButton(),
      StoryButton(),
      StoryButton(),
      StoryButton(),
      StoryButton(),
      StoryButton(),
      StoryButton(),
      StoryButton(),
    ];
    List<Widget> storyAndPosts = [
      SizedBox(
        height: 102,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(20, 8.5, 0, 8.5),
          itemBuilder: (context, index) {
            return buttons[index];
          },
          separatorBuilder: (context, index) => const SizedBox(width: 20),
          itemCount: buttons.length,
        ),
      ),
      const Post(),
      const Post(),
      const Post(),
      const Post(),
    ];
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
          icon: const CustomSvgIcon(
            assetName: Assets.cameraSVG,
            height: 25,
            width: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CustomSvgIcon(
              assetName: Assets.igtvRedCircleSVG,
              height: 25,
              width: 24,
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/messages'),
            icon: const CustomSvgIcon(
              assetName: Assets.messengerSVG,
              height: 20,
              width: 23,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return storyAndPosts[index];
              },
              separatorBuilder: (context, index) => const Divider(
                thickness: 0.1,
              ),
              itemCount: storyAndPosts.length,
            ),
          )
        ],
      ),
    );
  }
}
