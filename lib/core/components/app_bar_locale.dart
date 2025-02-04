import 'package:flutter/material.dart';

class AppBarLocale extends StatelessWidget implements PreferredSize {
  const AppBarLocale({super.key, required this.appBar});

  final Widget appBar;

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      locale: const Locale('en'),
      context: context,
      child: appBar,
    );
  }

  @override
  // TODO: implement child
  Widget get child => appBar;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
