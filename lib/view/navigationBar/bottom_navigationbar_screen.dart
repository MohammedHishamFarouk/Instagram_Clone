import 'package:flutter/material.dart';
import 'package:insgram_clone/core/components/custom_icons.dart';
import 'package:insgram_clone/core/constants/assets.dart';
import 'package:insgram_clone/view/navigationBar/home/home_screen.dart';
import 'package:insgram_clone/view/navigationBar/likes/likes_screen.dart';
import 'package:insgram_clone/view/navigationBar/profile/profile_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const Card(color: Colors.blueAccent),
    const Card(color: Colors.blueGrey),
    const LikesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          _selectedIndex = value;
          setState(() {});
        },
        items: [
          const BottomNavigationBarItem(
            icon: CustomSvgIcon(assetName: Assets.homeSVG),
            label: '',
            activeIcon: CustomSvgIcon(assetName: Assets.filledHomeSVG),
          ),
          const BottomNavigationBarItem(
            icon: CustomSvgIcon(assetName: Assets.searchSVG),
            label: '',
            activeIcon: CustomSvgIcon(assetName: Assets.filledSearchSVG),
          ),
          const BottomNavigationBarItem(
            icon: CustomSvgIcon(assetName: Assets.createSVG),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: CustomSvgIcon(assetName: Assets.likeSVG),
            label: '',
            activeIcon: CustomSvgIcon(assetName: Assets.filledLikeSVG),
          ),
          BottomNavigationBarItem(
            icon: const CircleAvatar(
              radius: 11.5,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(Assets.noProfile),
            ),
            activeIcon: CircleAvatar(
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              radius: 12.5,
              child: const CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 11,
                backgroundImage: AssetImage(Assets.noProfile),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
