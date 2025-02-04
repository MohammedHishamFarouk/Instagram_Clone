import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/core/components/create_new_story.dart';
import 'package:insgram_clone/core/components/custom_icons.dart';
import 'package:insgram_clone/core/components/story_button.dart';
import 'package:insgram_clone/core/constants/assets.dart';
import 'package:insgram_clone/core/constants/fire_keys.dart';
import 'package:insgram_clone/modelView/authentication/auth_cubit.dart';
import 'package:insgram_clone/modelView/themeManager/theme_manager_cubit.dart';
import 'package:insgram_clone/view/navigationBar/profile/profile/componenets/custom_drawer.dart';
import 'package:insgram_clone/view/navigationBar/profile/profile/componenets/drawer_animation.dart';
import 'package:insgram_clone/view/navigationBar/profile/profile/componenets/profile_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double halfScreenWidth = MediaQuery.sizeOf(context).width > 700
        ? 700 * 0.67
        : MediaQuery.sizeOf(context).width * 0.67;
    final ThemeManagerCubit drawerState = context.read<ThemeManagerCubit>();
    drawerState.isDrawerOpen = false;
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
    ];

    return DefaultTabController(
      length: 2,
      child: BlocBuilder<ThemeManagerCubit, ThemeManagerState>(
        builder: (context, state) {
          return Stack(
            children: [
              // The Drawer
              DrawerAnimation(
                right: drawerState.isDrawerOpen ? 0 : -halfScreenWidth,
                width: halfScreenWidth,
                child: const CustomDrawer(),
              ),
              DrawerAnimation(
                left: drawerState.isDrawerOpen ? -halfScreenWidth : 0,
                right: drawerState.isDrawerOpen ? halfScreenWidth : 0,
                child: Scaffold(
                  appBar: AppBar(
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 4,
                      children: [
                        const CustomSvgIcon(assetName: Assets.lockSVG),
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            return Text(
                              context
                                  .read<AuthCubit>()
                                  .userData![FireKeys.userName],
                              style: const TextStyle(fontSize: 16),
                            );
                          },
                        ),
                        const CustomSvgIcon(
                          assetName: Assets.arrowDownSVG,
                        ),
                      ],
                    ),
                    actions: [
                      IconButton(
                        onPressed: () => drawerState.toggleDrawer(),
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
              ),
            ],
          );
        },
      ),
    );
  }
}
