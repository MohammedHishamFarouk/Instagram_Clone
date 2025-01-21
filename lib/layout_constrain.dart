import 'package:flutter/material.dart';

class LayoutConstrain extends StatelessWidget {
  const LayoutConstrain({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: child,
        ),
      ),
    );
  }
}
