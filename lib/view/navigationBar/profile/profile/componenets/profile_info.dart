import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/core/components/custom_icons.dart';
import 'package:insgram_clone/core/components/story_button.dart';
import 'package:insgram_clone/core/constants/assets.dart';
import 'package:insgram_clone/core/constants/fire_keys.dart';
import 'package:insgram_clone/modelView/authentication/auth_cubit.dart';

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
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StoryButton(
              addText: false,
              size: 40,
            ),
            Text(
              '0\nposts',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '0\nFollowers',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '0\nFollowing',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            Text(
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
            child: const Text(
              'Edit Profile',
              style: TextStyle(fontSize: 13),
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
        const SizedBox(
          height: 32,
          child: TabBar(
            tabs: [
              Tab(
                icon: CustomSvgIcon(assetName: Assets.gridSVG),
              ),
              Tab(
                icon: CustomSvgIcon(assetName: Assets.tagsSVG),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
