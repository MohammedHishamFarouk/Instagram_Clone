import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/modelView/themeManager/theme_manager_cubit.dart';

class DrawerAnimation extends StatelessWidget {
  const DrawerAnimation({
    super.key,
    this.width,
    required this.child,
    this.left,
    this.right,
  });

  final double? width;
  final Widget child;
  final double? left;
  final double? right;

  @override
  Widget build(BuildContext context) {
    final ThemeManagerCubit localeState = context.read<ThemeManagerCubit>();
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      top: 0,
      bottom: 0,
      left: localeState.isEnglish ? left : right,
      right: localeState.isEnglish ? right : left,
      width: width,
      child: child,
    );
  }
}
