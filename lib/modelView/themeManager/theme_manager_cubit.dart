import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/modelView/authentication/auth_cubit.dart';
import 'package:insgram_clone/view/core/constants/cloud_service_keys.dart';

part 'theme_manager_state.dart';

class ThemeManagerCubit extends Cubit<ThemeManagerState> {
  ThemeManagerCubit() : super(ThemeManagerInitial());

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  bool isDark = true;
  bool isEnglish = true;
  bool isDrawerOpen = false;
  int current = 0;

  void changeTheme(BuildContext context) async {
    try {
      isDark = !isDark;
      await _fireStore
          .collection('users')
          .doc(context.read<AuthCubit>().user!.uid)
          .set(
        {'isDark': isDark},
        SetOptions(merge: true),
      );
      emit(ThemeChanged());
    } catch (e) {
      log(e.toString());
    }
  }

  void changeLocale(BuildContext context) async {
    try {
      isEnglish = !isEnglish;
      await _fireStore
          .collection('users')
          .doc(context.read<AuthCubit>().user!.uid)
          .set(
        {'isEnglish': isEnglish},
        SetOptions(merge: true),
      );
      emit(ThemeChanged());
    } catch (e) {
      log(e.toString());
    }
  }

  void loadTheme(BuildContext context) async {
    try {
      final doc = await _fireStore
          .collection('users')
          .doc(context.read<AuthCubit>().user!.uid)
          .get();
      if (doc.data()?[FireKeys.isDark] != null) {
        isDark = doc.data()![FireKeys.isDark];
      }
      if (doc.data()?[FireKeys.isEnglish] != null) {
        isEnglish = doc.data()![FireKeys.isEnglish];
      }
      emit(ThemeChanged());
    } catch (e) {
      log('here is the error${e.toString()}');
    }
  }

  void toggleDrawer() {
    isDrawerOpen = !isDrawerOpen;
    emit(DrawerMoved());
  }

  void signOutLocale() {
    isEnglish = true;
    emit(ThemeChanged());
  }

  void tabSelected(int index) {
    current = index;
    emit(TabChanged());
  }
}
