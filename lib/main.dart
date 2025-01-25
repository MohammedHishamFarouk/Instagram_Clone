import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/core/style/theme_manager.dart';
import 'package:insgram_clone/firebase_options.dart';
import 'package:insgram_clone/layout_constrain.dart';
import 'package:insgram_clone/modelView/theme_manager_cubit.dart';
import 'package:insgram_clone/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => ThemeManagerCubit()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutConstrain(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.darkTheme,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
