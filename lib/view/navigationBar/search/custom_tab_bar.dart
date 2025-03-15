import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/modelView/search/search_cubit.dart';
import 'package:insgram_clone/view/core/components/custom_icons.dart';
import 'package:insgram_clone/view/core/constants/assets.dart';
import 'package:insgram_clone/view/core/generated/l10n.dart';
import 'package:insgram_clone/view/core/style/color_manager.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 5,
        children: [
          const CustomSvgIcon(assetName: Assets.igtvSVG),
          Text(
            S.of(context).IGTV,
          ),
        ],
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 5,
        children: [
          const CustomSvgIcon(assetName: Assets.shopSVG),
          Text(
            S.of(context).shop,
          ),
        ],
      ),
      Text(
        S.of(context).style,
      ),
      Text(
        S.of(context).sports,
      ),
      Text(
        S.of(context).auto,
      ),
      Text(
        S.of(context).music,
      ),
    ];
    return SizedBox(
      height: 32,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  context.read<SearchCubit>().changeTab(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  height: 32,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: context.read<SearchCubit>().current == index
                            ? Theme.of(context).secondaryHeaderColor
                            : ColorManager.lightGrey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: children[index],
                  ),
                ),
              );
            },
          );
        },
        itemCount: children.length,
      ),
    );
  }
}
