import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/core/components/create_new_story.dart';
import 'package:insgram_clone/core/components/custom_icons.dart';
import 'package:insgram_clone/core/components/story_button.dart';
import 'package:insgram_clone/core/constants/assets.dart';
import 'package:insgram_clone/core/constants/fire_keys.dart';
import 'package:insgram_clone/modelView/authentication/auth_cubit.dart';
import 'package:insgram_clone/view/navigationBar/profile/profile/profile_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [
      const CreateNewStory(),
      const StoryButton(),
      const StoryButton(),
    ];

    List<Widget> assetsTrial = const [
      Image(
        image: AssetImage(Assets.noProfile),
        fit: BoxFit.cover,
      ),
      Image(
        image: AssetImage(Assets.trial3),
        fit: BoxFit.cover,
      ),
      Image(
        image: AssetImage(Assets.trial1),
        fit: BoxFit.cover,
      ),
      Image(
        image: AssetImage(Assets.trial2),
        fit: BoxFit.cover,
      ),
      Image(
        image: AssetImage(Assets.trial1),
        fit: BoxFit.cover,
      ),
    ];

    //constraints: const BoxConstraints(maxWidth: 740),

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 3,
            children: [
              const CustomSvgIcon(assetName: Assets.lockSVG),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return Text(
                    context.read<AuthCubit>().userData![FireKeys.userName],
                    style: const TextStyle(fontSize: 16),
                  );
                },
              ),
              const Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 20,
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () => context.read<AuthCubit>().signOut(context),
              icon: const CustomSvgIcon(assetName: Assets.menuSVG),
              iconSize: 22,
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11.0),
              child: ProfileInfo(buttons: buttons),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      return assetsTrial[index];
                    },
                    itemCount: assetsTrial.length,
                  ),
                  const Card(
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
