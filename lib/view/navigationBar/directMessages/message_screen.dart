import 'package:flutter/material.dart';
import 'package:insgram_clone/core/components/custom_icons.dart';
import 'package:insgram_clone/core/components/custom_search_bar.dart';
import 'package:insgram_clone/core/constants/assets.dart';
import 'package:insgram_clone/generated/l10n.dart';
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
          icon: const CustomSvgIcon(assetName: Assets.backArrowSVG),
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
            CustomSvgIcon(assetName: Assets.arrowDownSVG),
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
            CustomSearchBar(
              hintText: S.of(context).search,
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
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    const CustomSvgIcon(assetName: Assets.gradientCameraSVG),
                    Text(
                      S.of(context).camera,
                      style: const TextStyle(color: Colors.blue, fontSize: 13),
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
