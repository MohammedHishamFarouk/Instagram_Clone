import 'package:flutter/material.dart';
import 'package:insgram_clone/core/components/custom_icons.dart';
import 'package:insgram_clone/core/constants/assets.dart';
import 'package:insgram_clone/view/navigationBar/directMessages/components/chat_box.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> trialList = const [
      ChatBox(
        messageSeen: true,
        name: 'mohamed',
        latestMessage: 'hey bro hop on, we have a game to win',
        sentTime: 'now',
      ),
      ChatBox(
        profilePic: Assets.trial3,
        name: 'penjel',
        latestMessage: 'hey bro hop on, we have a game to win',
        sentTime: 'now',
      ),
      ChatBox(
        profilePic: Assets.trial1,
        name: 'magdey',
        latestMessage: 'hey bro hop on, we have a game to win',
        sentTime: 'now',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 3,
          children: [
            CustomSvgIcon(assetName: Assets.lockSVG),
            Text(
              'jacob_w',
              style: TextStyle(fontSize: 16),
            ),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 20,
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CustomSvgIcon(assetName: Assets.plusSVG),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          spacing: 10,
          children: [
            const SizedBox(
              height: 36,
              child: SearchBar(
                leading: CustomSvgIcon(assetName: Assets.searchBarSVG),
                hintText: 'Search',
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemExtent: 80,
                itemBuilder: (context, index) {
                  return trialList[index];
                },
                itemCount: trialList.length,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
              child: IconButton(
                onPressed: () {},
                icon: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    CustomSvgIcon(assetName: Assets.gradientCameraSVG),
                    Text(
                      'Camera',
                      style: TextStyle(color: Colors.blue, fontSize: 13),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
