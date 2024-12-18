import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insgram_clone/core/components/post.dart';
import 'package:insgram_clone/core/components/story_button.dart';
import 'package:insgram_clone/core/constants/assets.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.homeSVG),
            label: '',
            activeIcon: SvgPicture.asset(Assets.filledHomeSVG),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.searchSVG),
            label: '',
            activeIcon: SvgPicture.asset(Assets.filledSearchSVG),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.createSVG),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.likeSVG),
            label: '',
            activeIcon: SvgPicture.asset(Assets.filledLikeSVG),
          ),
          const BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 11.5,
              backgroundImage: AssetImage(Assets.noProfile),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
