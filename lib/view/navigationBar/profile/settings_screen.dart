import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/core/components/custom_icons.dart';
import 'package:insgram_clone/core/constants/assets.dart';
import 'package:insgram_clone/generated/l10n.dart';
import 'package:insgram_clone/modelView/themeManager/theme_manager_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const CustomSvgIcon(
            assetName: Assets.backArrowSVG,
          ),
          alignment: Alignment.centerLeft,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 15,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).changeTheme),
                const _ToggleButton(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).changeLang),
                const _ToggleButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ToggleButton extends StatelessWidget {
  const _ToggleButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<ThemeManagerCubit>().changeTheme(context),
      child: BlocBuilder<ThemeManagerCubit, ThemeManagerState>(
        builder: (context, state) {
          final bool isDark = context.read<ThemeManagerCubit>().isDark;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              color: !isDark ? Colors.yellow : Colors.blueGrey,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  left: isDark ? 0.0 : 30.0,
                  right: isDark ? 30.0 : 0.0,
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Center(
                      child: Icon(
                        !isDark ? Icons.wb_sunny : Icons.nightlight_round,
                        color: !isDark ? Colors.orange : Colors.black,
                        size: 15.0, // Adjusted icon size
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
