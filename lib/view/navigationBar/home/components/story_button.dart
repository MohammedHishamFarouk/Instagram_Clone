import 'package:flutter/material.dart';
import 'package:insgram_clone/core/constants/assets.dart';
import 'package:insgram_clone/core/style/color_manager.dart';

class StoryButton extends StatelessWidget {
  const StoryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: ColorManager.signatureColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(3.0),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 31,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 28,
                backgroundImage: AssetImage(Assets.noProfile),
              ),
            ),
          ),
        ),
        Text(
          'mohammed',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
