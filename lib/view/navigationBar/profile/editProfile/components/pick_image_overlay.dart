import 'package:flutter/material.dart';

class PickImageOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const PickImageOverlay({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black.withValues(alpha: 0.8),
          ),
      ],
    );
  }
}
