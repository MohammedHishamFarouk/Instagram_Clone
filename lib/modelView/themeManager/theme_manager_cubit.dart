import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/core/constants/fire_keys.dart';
import 'package:insgram_clone/modelView/authentication/auth_cubit.dart';

part 'theme_manager_state.dart';

class ThemeManagerCubit extends Cubit<ThemeManagerState> {
  ThemeManagerCubit() : super(ThemeManagerInitial());

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  bool isDark = true;
  bool isDrawerOpen = false;

  void changeTheme(BuildContext context) async {
    isDark = !isDark;
    isDark ? emit(DarkTheme()) : emit(LightTheme());
    try {
      await _fireStore
          .collection('users')
          .doc(context.read<AuthCubit>().user!.uid)
          .set({'isDark': isDark}, SetOptions(merge: true));
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
      if (doc.exists && doc.data() != null) {
        isDark = doc.data()![FireKeys.isDark];
        isDark ? emit(DarkTheme()) : emit(LightTheme());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void toggleDrawer() {
    isDrawerOpen = !isDrawerOpen;
    emit(DrawerMoved());
  }
}
