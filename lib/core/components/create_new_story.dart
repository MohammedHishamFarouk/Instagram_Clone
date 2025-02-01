import 'package:flutter/material.dart';
import 'package:insgram_clone/core/components/custom_icons.dart';
import 'package:insgram_clone/core/constants/assets.dart';
import 'package:insgram_clone/core/style/color_manager.dart';

class CreateNewStory extends StatelessWidget {
  const CreateNewStory({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.lightGrey),
              shape: BoxShape.circle,
            ),
            child: const CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 35,
              child: CustomSvgIcon(assetName: Assets.plusSVG),
            ),
          ),
          const Text(
            'New',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
