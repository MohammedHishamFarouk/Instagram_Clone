import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_manager_state.dart';

class ThemeManagerCubit extends Cubit<ThemeManagerState> {
  ThemeManagerCubit() : super(ThemeManagerInitial());

  bool isDark = true;

  void changeTheme() {
    isDark = !isDark;
    log('$isDark');
    isDark ? emit(DarkTheme()) : emit(LightTheme());
  }
}
