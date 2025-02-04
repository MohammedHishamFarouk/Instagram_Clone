import 'package:flutter/material.dart';
import 'package:insgram_clone/core/components/custom_icons.dart';
import 'package:insgram_clone/core/constants/assets.dart';
import 'package:insgram_clone/generated/l10n.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, this.controller, this.onChanged});

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: SearchBar(
        controller: controller,
        leading: const CustomSvgIcon(assetName: Assets.searchBarSVG),
        hintText: S.of(context).search,
        onChanged: onChanged,
      ),
    );
  }
}
