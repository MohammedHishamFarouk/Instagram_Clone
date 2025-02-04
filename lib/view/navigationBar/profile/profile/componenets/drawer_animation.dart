import 'package:flutter/material.dart';

class DrawerAnimation extends StatelessWidget {
  const DrawerAnimation({
    super.key,
    this.width,
    required this.child,
    this.left,
    required this.right,
  });

  final double? width;
  final Widget child;
  final double? left;
  final double right;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      top: 0,
      bottom: 0,
      left: left,
      right: right,
      width: width,
      child: child,
    );
  }
}
