import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/modelView/authentication/auth_cubit.dart';
import 'package:insgram_clone/modelView/themeManager/theme_manager_cubit.dart';
import 'package:insgram_clone/view/core/components/custom_icons.dart';
import 'package:insgram_clone/view/core/constants/assets.dart';
import 'package:insgram_clone/view/core/constants/cloud_service_keys.dart';
import 'package:insgram_clone/view/core/generated/l10n.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
              children: [
                ListTile(
                  title: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return Text(
                        context.read<AuthCubit>().userData![FireKeys.userName],
                      );
                    },
                  ),
                ),
                ListTile(
                  leading: const CustomSvgIcon(
                    assetName: Assets.archiveSVG,
                  ),
                  title: Text(S.of(context).archive),
                  onTap: () {},
                ),
                ListTile(
                  leading: const CustomSvgIcon(
                    assetName: Assets.activitySVG,
                  ),
                  title: Text(S.of(context).yourActivity),
                  onTap: () {},
                ),
                ListTile(
                  leading: const CustomSvgIcon(
                    assetName: Assets.liveSVG,
                  ),
                  title: Text(S.of(context).nameTag),
                  onTap: () {},
                ),
                ListTile(
                  leading: const CustomSvgIcon(
                    assetName: Assets.saveSVG,
                  ),
                  title: Text(S.of(context).save),
                  onTap: () {},
                ),
                ListTile(
                  leading: const CustomSvgIcon(
                    assetName: Assets.closeFriendsSVG,
                  ),
                  title: Text(S.of(context).closeFriends),
                  onTap: () {},
                ),
                ListTile(
                  leading: const CustomSvgIcon(
                    assetName: Assets.addPeopleSVG,
                  ),
                  title: Text(S.of(context).discoverPeople),
                  onTap: () {},
                ),
                ListTile(
                  leading: const CustomSvgIcon(
                    assetName: Assets.openFaceSVG,
                  ),
                  title: Text(S.of(context).openFacebook),
                  onTap: () {},
                ),
              ],
            ),
          ),
          ListTile(
            leading: const CustomSvgIcon(
              assetName: Assets.settingsSVG,
            ),
            title: Text(S.of(context).settings),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
              context.read<ThemeManagerCubit>().toggleDrawer();
            },
          ),
        ],
      ),
    );
  }
}
