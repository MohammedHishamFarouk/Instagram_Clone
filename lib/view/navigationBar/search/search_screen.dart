import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insgram_clone/modelView/search/search_cubit.dart';
import 'package:insgram_clone/view/core/components/custom_icons.dart';
import 'package:insgram_clone/view/core/components/custom_search_bar.dart';
import 'package:insgram_clone/view/core/constants/assets.dart';
import 'package:insgram_clone/view/core/constants/cloud_service_keys.dart';
import 'package:insgram_clone/view/core/generated/l10n.dart';
import 'package:insgram_clone/view/navigationBar/directMessages/components/chat_box.dart';
import 'package:insgram_clone/view/navigationBar/search/custom_tab_bar.dart';

import '../../trial.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 56,
          actions: [
            Flexible(
              child: CustomSearchBar(
                onChanged: (query) {
                  context.read<SearchCubit>().searchUsersByUsername(query);
                },
                hintText: S.of(context).searchForUsers,
              ),
            ),
            const SizedBox(width: 10),
            const CustomSvgIcon(assetName: Assets.liveSVG),
          ],
        ),
        body: Column(
          spacing: 5,
          children: [
            const CustomTabBar(),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  switch (state) {
                    case SearchLoading():
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    case SearchSuccess():
                      if (context.read<SearchCubit>().users.isEmpty) {
                        return Center(
                          child: Text(S.of(context).noUsers),
                        );
                      }
                      return ListView.separated(
                        itemCount: context.read<SearchCubit>().users.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(height: 20),
                        itemBuilder: (context, index) {
                          final user = context.read<SearchCubit>().users[index];
                          return ChatBox(
                            name: user[FireKeys.userName],
                            latestMessage: user[FireKeys.bio] ?? '',
                            sentTime: '',
                            showIcon: false,
                          );
                        },
                      );
                    case SearchFailure():
                      return Center(
                        child: Text(S.of(context).somethingWentWrong),
                      );
                    default:
                      return GridView.custom(
                        gridDelegate: SliverQuiltedGridDelegate(
                          crossAxisCount: 3,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 2,
                          repeatPattern: QuiltedGridRepeatPattern.inverted,
                          pattern: const [
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(2, 2),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                          ],
                        ),
                        childrenDelegate: SliverChildBuilderDelegate(
                          childCount: assetsTrial.length,
                          (context, index) => assetsTrial[index],
                        ),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
