import 'package:flutter/material.dart';
import 'package:insgram_clone/core/route_generator.dart';
import 'package:insgram_clone/core/style/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.darkTheme,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
