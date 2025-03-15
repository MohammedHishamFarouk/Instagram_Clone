import 'package:flutter/material.dart';
import 'package:insgram_clone/view/core/components/custom_icons.dart';
import 'package:insgram_clone/view/core/constants/assets.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {super.key, this.controller, this.onChanged, required this.hintText});

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: SearchBar(
        controller: controller,
        leading: const CustomSvgIcon(assetName: Assets.searchBarSVG),
        hintText: hintText,
        onChanged: onChanged,
      ),
    );
  }
}
