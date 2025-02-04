import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:insgram_clone/core/firebase_options.dart';
import 'package:insgram_clone/core/style/theme_manager.dart';
import 'package:insgram_clone/generated/l10n.dart';
import 'package:insgram_clone/modelView/authentication/auth_cubit.dart';
import 'package:insgram_clone/modelView/search/search_cubit.dart';
import 'package:insgram_clone/modelView/themeManager/theme_manager_cubit.dart';
import 'package:insgram_clone/route_generator.dart';
import 'package:insgram_clone/view/layout_constrain.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => ThemeManagerCubit()),
      BlocProvider(create: (context) => SearchCubit()),
      BlocProvider(create: (context) => AuthCubit()..checkForUser()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeManagerCubit, ThemeManagerState>(
      builder: (context, state) {
        final ThemeManagerCubit theme = context.read<ThemeManagerCubit>();
        return LayoutConstrain(
          child: MaterialApp(
            locale: theme.isEnglish ? const Locale('en') : const Locale('ar'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme:
                theme.isDark ? ThemeManager.darkTheme : ThemeManager.lightTheme,
            onGenerateRoute: RouteGenerator.generateRoute,
          ),
        );
      },
    );
  }
}
