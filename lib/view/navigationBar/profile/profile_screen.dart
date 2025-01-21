import 'package:flutter/material.dart';
import 'package:insgram_clone/core/components/custom_icons.dart';
import 'package:insgram_clone/core/components/story_button.dart';
import 'package:insgram_clone/core/constants/assets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = const [
      StoryButton(),
      StoryButton(),
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
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 3,
            children: [
              CustomSvgIcon(assetName: Assets.lockSVG),
              Text(
                'jacob_w',
                style: TextStyle(fontSize: 16),
              ),
              Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 20,
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const CustomSvgIcon(assetName: Assets.menuSVG),
              iconSize: 22,
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11.0),
              child: Column(
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
                        '54\nposts',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '54\nFollowers',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '54\nFollowing',
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
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Jacob west',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Digital goodies designer @pixsellz Everything is designed',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 30,
                    child: FilledButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/editProfile'),
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
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 20),
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
              ),
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
