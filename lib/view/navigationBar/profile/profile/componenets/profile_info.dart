import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/modelView/authentication/auth_cubit.dart';
import 'package:insgram_clone/modelView/themeManager/theme_manager_cubit.dart';
import 'package:insgram_clone/view/core/components/custom_icons.dart';
import 'package:insgram_clone/view/core/components/story_button.dart';
import 'package:insgram_clone/view/core/constants/assets.dart';
import 'package:insgram_clone/view/core/constants/cloud_service_keys.dart';
import 'package:insgram_clone/view/core/generated/l10n.dart';
import 'package:insgram_clone/view/core/style/color_manager.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
    required this.buttons,
  });

  final List<Widget> buttons;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const StoryButton(
              addText: false,
              size: 40,
            ),
            Text(
              '0\n${S.of(context).posts}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              '0\n${S.of(context).followers}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              '0\n${S.of(context).following}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const Text(
              '',
            ),
          ],
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 290),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return Text(
                    context.read<AuthCubit>().userData![FireKeys.fullName],
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  log(state.toString());
                  return Text(
                    context.read<AuthCubit>().userData![FireKeys.bio],
                    style: const TextStyle(fontSize: 12),
                  );
                },
              )
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 30,
          child: FilledButton(
            onPressed: () => Navigator.pushNamed(context, '/editProfile'),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              side: BorderSide(color: Colors.grey.shade800),
            ),
            child: Text(
              S.of(context).editProfile,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ),
        SizedBox(
          height: 102,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return buttons[index];
            },
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemCount: buttons.length,
          ),
        ),
        SizedBox(
          height: 32,
          child: BlocBuilder<ThemeManagerCubit, ThemeManagerState>(
              buildWhen: (previous, current) =>
                  current is ThemeChanged || current is LocaleChanged,
              builder: (context, state) {
                ThemeManagerCubit themeManager =
                    context.read<ThemeManagerCubit>();
                return BlocBuilder<ThemeManagerCubit, ThemeManagerState>(
                  buildWhen: (previous, current) => current is TabChanged,
                  builder: (context, state) {
                    log(state.toString());
                    return TabBar(
                      tabs: [
                        Tab(
                          icon: CustomSvgIcon(
                            assetName: Assets.gridSVG,
                            color: themeManager.current == 0
                                ? ColorManager.semiTransBlue
                                : Colors.grey,
                          ),
                        ),
                        Tab(
                          icon: CustomSvgIcon(
                            assetName: Assets.tagsSVG,
                            color: themeManager.current == 1
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        ),
                      ],
                      onTap: (index) {
                        themeManager.tabSelected(index);
                      },
                    );
                  },
                );
              }),
        ),
      ],
    );
  }
}
