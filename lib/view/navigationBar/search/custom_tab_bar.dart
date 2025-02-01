import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/core/components/custom_icons.dart';
import 'package:insgram_clone/core/constants/assets.dart';
import 'package:insgram_clone/core/style/color_manager.dart';
import 'package:insgram_clone/modelView/search/search_cubit.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = const [
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 5,
        children: [
          CustomSvgIcon(assetName: Assets.igtvSVG),
          Text(
            'IGTV',
          ),
        ],
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 5,
        children: [
          CustomSvgIcon(assetName: Assets.shopSVG),
          Text(
            'Shop',
          ),
        ],
      ),
      Text(
        'Style',
      ),
      Text(
        'Sports',
      ),
      Text(
        'Auto',
      ),
      Text(
        'Music',
      ),
    ];
    int current = 0;
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
                  duration: const Duration(milliseconds: 300),
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
