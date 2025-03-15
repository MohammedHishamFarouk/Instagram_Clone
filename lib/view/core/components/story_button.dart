import 'package:flutter/material.dart';
import 'package:insgram_clone/view/core/constants/assets.dart';
import 'package:insgram_clone/view/core/style/color_manager.dart';

class StoryButton extends StatelessWidget {
  const StoryButton({
    super.key,
    this.addText = true,
    this.size = 28,
    this.borderSize = 3,
    this.live = false,
    this.seen = false,
  });

  final bool addText;
  final bool live;
  final bool seen;
  final double size;
  final double borderSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: live
                    ? ColorManager.liveColor
                    : seen
                        ? null
                        : ColorManager.signatureColor,
              ),
              child: Padding(
                // Adjust borderSize as needed
                padding: EdgeInsets.all(borderSize),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    // Additional padding to create the gap
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: size,
                      backgroundImage: const AssetImage(Assets.noProfile),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: live,
              child: Container(
                height: 16,
                width: 28,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
            Visibility(
              visible: live,
              child: Container(
                height: 14,
                width: 24,
                decoration: BoxDecoration(
                  gradient: ColorManager.liveColor,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const Center(
                  child: Text(
                    'LIVE',
                    style: TextStyle(fontSize: 8),
                  ),
                ),
              ),
            ),
          ],
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
