import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:insgram_clone/view/core/components/custom_icons.dart';
import 'package:insgram_clone/view/core/components/story_button.dart';
import 'package:insgram_clone/view/core/constants/assets.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          leading: const StoryButton(
            addText: false,
            size: 16,
            borderSize: 2,
          ),
          title: const Row(
            children: [
              Text(
                'mohammed',
                style: TextStyle(fontSize: 13),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: CustomSvgIcon(
                    assetName: Assets.officialSVG,
                    height: 10,
                    width: 10,
                  )),
            ],
          ),
          subtitle: const Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
              'hisham',
              style: TextStyle(fontSize: 11),
            ),
          ),
          trailing: GestureDetector(
            onTap: () {},
            child: const SizedBox(
              child: CustomSvgIcon(
                assetName: Assets.moreSVG,
                height: 3,
                width: 14,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            log('tapped');
          },
          child: SizedBox(
            height: 375,
            width: MediaQuery.sizeOf(context).width,
            child: const Image(
              image: AssetImage(Assets.trial3),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const CustomSvgIcon(assetName: Assets.likeSVG),
            ),
            IconButton(
              onPressed: () {},
              icon: const CustomSvgIcon(assetName: Assets.commentSVG),
            ),
            IconButton(
              onPressed: () {},
              icon: const CustomSvgIcon(assetName: Assets.messengerSVG),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const CustomSvgIcon(assetName: Assets.saveSVG),
            )
          ],
        ),
        const ListTile(
          contentPadding: EdgeInsets.only(left: 12),
          horizontalTitleGap: 7,
          leading: CircleAvatar(
            radius: 8.5,
            backgroundImage: AssetImage(Assets.trial2),
          ),
          title: Text('Liked by craig_love and 44,686 others'),
          minTileHeight: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 12.0, right: 18),
          child: Text(
            'joshua_l The game in Japan was amazing and I want to share some photos',
            style: TextStyle(fontSize: 13),
          ),
        )
      ],
    );
  }
}
