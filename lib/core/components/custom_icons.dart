import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insgram_clone/core/constants/assets.dart';
import 'package:insgram_clone/modelView/themeManager/theme_manager_cubit.dart';

class CustomSvgIcon extends StatelessWidget {
  const CustomSvgIcon(
      {super.key,
      required this.assetName,
      this.height,
      this.width,
      this.color});

  final String assetName;
  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeManagerCubit, ThemeManagerState>(
      builder: (context, state) {
        //by ensuring that the name for the dark and light icons are the same
        //we can then call the right icon for the right theme by its location in the assets
        return context.read<ThemeManagerCubit>().isDark
            ? SvgPicture.asset(
                '${Assets.darkAssetBaseUrl}$assetName',
                height: height,
                width: width,
                color: color,
              )
            : SvgPicture.asset(
                '${Assets.lightAssetBaseUrl}$assetName',
                height: height,
                width: width,
                color: color,
              );
      },
    );
  }
}
