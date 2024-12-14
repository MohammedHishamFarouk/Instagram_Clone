import 'package:flutter/material.dart';
import 'package:insgram_clone/core/constants/assets.dart';
import 'package:insgram_clone/core/style/color_manager.dart';

class StoryButton extends StatelessWidget {
  const StoryButton({
    super.key,
    this.addText = true,
    this.size = 28,
    this.borderSize = 3,
  });

  final bool addText;
  final double size;
  final double borderSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: ColorManager.signatureColor,
          ),
          //changes the border size
          child: Padding(
            padding: EdgeInsets.all(borderSize),
            //uses the same color as the background to look like a gap between the gradient and image
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: size + 3,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: size,
                backgroundImage: const AssetImage(Assets.noProfile),
              ),
            ),
          ),
        ),
        if (addText)
          const Text(
            'mohammed',
            style: TextStyle(fontSize: 12),
          ),
      ],
    );
  }
}
