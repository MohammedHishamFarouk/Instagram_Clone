import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/core/components/custom_icons.dart';
import 'package:insgram_clone/core/constants/assets.dart';
import 'package:insgram_clone/generated/l10n.dart';
import 'package:insgram_clone/modelView/authentication/auth_cubit.dart';
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
                const _ToggleButton(false),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).changeLang),
                const _ToggleButton(true),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    context.read<AuthCubit>().signOut(context);
                    context.read<ThemeManagerCubit>().signOutLocale();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    padding: const EdgeInsets.all(0),
                  ),
                  child: Text(S.of(context).signOut),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ToggleButton extends StatelessWidget {
  const _ToggleButton(this.isLangMode);

  final bool isLangMode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final themeManager = context.read<ThemeManagerCubit>();
        if (isLangMode) {
          themeManager.changeLocale(context);
        } else {
          themeManager.changeTheme(context);
        }
      },
      child: BlocBuilder<ThemeManagerCubit, ThemeManagerState>(
        builder: (context, state) {
          final themeManager = context.read<ThemeManagerCubit>();
          final isDark = themeManager.isDark;
          final isEnglish = themeManager.isEnglish;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              child: Container(
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: _getIconOrText(context, isLangMode, isEnglish, isDark),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getIconOrText(
      BuildContext context, bool isLangMode, bool isEnglish, bool isDark) {
    if (isLangMode) {
      return Text(
        isEnglish ? 'EN' : 'AR',
        style: TextStyle(color: Theme.of(context).primaryColor),
      );
    }
    return Icon(
      isDark ? Icons.nightlight_round : Icons.wb_sunny,
      color: isDark ? Colors.black : Colors.orange,
      size: 15.0,
    );
  }
}
