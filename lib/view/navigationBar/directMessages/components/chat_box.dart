import 'package:flutter/material.dart';
import 'package:insgram_clone/core/components/custom_icons.dart';
import 'package:insgram_clone/core/constants/assets.dart';
import 'package:insgram_clone/core/style/color_manager.dart';

class ChatBox extends StatelessWidget {
  const ChatBox({
    super.key,
    this.profilePic = Assets.noProfile,
    required this.name,
    required this.latestMessage,
    required this.sentTime,
    this.messageSeen = false,
    this.showIcon = true,
  });

  final String profilePic;
  final String name;
  final String latestMessage;
  final String sentTime;
  final bool messageSeen;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        minTileHeight: 0,
        visualDensity: const VisualDensity(vertical: 3),
        contentPadding: const EdgeInsets.only(top: 10),
        leading: CircleAvatar(
          backgroundColor:
              messageSeen ? Colors.transparent : Colors.grey.shade800,
          radius: 32,
          child: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 31,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(profilePic),
              radius: 28,
            ),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 13),
          maxLines: 1,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 6,
          children: [
            Flexible(
              child: Text(
                latestMessage,
                style: const TextStyle(
                  fontSize: 13,
                  color: ColorManager.grey,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            ),
            Visibility(
              visible: showIcon,
              child: Text(
                '· $sentTime',
                style: const TextStyle(fontSize: 13, color: ColorManager.grey),
              ),
            ),
          ],
        ),
        trailing: Visibility(
          visible: showIcon,
          child: IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            icon: const CustomSvgIcon(
              assetName: Assets.cameraSVG,
              height: 22,
              width: 24,
              color: ColorManager.grey,
            ),
          ),
        ),
      ),
    );
  }
}
