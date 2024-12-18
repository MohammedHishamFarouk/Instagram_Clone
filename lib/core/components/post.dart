import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insgram_clone/core/constants/assets.dart';
import 'package:insgram_clone/view/navigationBar/home/components/story_button.dart';

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
          title: Row(
            children: [
              const Text(
                'mohammed',
                style: TextStyle(fontSize: 13),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: SvgPicture.asset(
                  Assets.officialSVG,
                  height: 10,
                  width: 10,
                ),
              ),
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
            child: SizedBox(
              child: SvgPicture.asset(
                Assets.moreSVG,
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
              icon: SvgPicture.asset(Assets.likeSVG),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(Assets.commentSVG),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(Assets.messengerSVG),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(Assets.saveSVG),
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
