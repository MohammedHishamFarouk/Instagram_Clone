import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:insgram_clone/core/constants/fire_keys.dart';
import 'package:insgram_clone/model/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  TextEditingController signInEmail = TextEditingController();

  TextEditingController signInPassword = TextEditingController();

  TextEditingController signUpEmail = TextEditingController();

  TextEditingController signUpPassword = TextEditingController();

  TextEditingController fullName = TextEditingController();

  TextEditingController userName = TextEditingController();

  TextEditingController editName = TextEditingController();

  TextEditingController editUserName = TextEditingController();

  TextEditingController editWebsite = TextEditingController();

  TextEditingController editBio = TextEditingController();

  User? user;

  UserModel _userFromFirebase(User user) {
    return UserModel(uid: user.uid);
  }

  textFieldFilled() {
    emit(TextFieldFilled());
  }

  Map<String, dynamic>? userData;

  checkForUser() {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        emit(SignUpLoading());
        DocumentSnapshot userDoc =
            await _fireStore.collection('users').doc(user.uid).get();
        this.user = _auth.currentUser;
        if (userDoc.exists) {
          userData = userDoc.data() as Map<String, dynamic>?;
          log('User data: $userData');
          //here we put the data we gat in the edit profile text fields
          editName.text = userData![FireKeys.fullName];
          editUserName.text = userData![FireKeys.userName];
          if (userData!.containsKey(FireKeys.website)) {
            editWebsite.text = userData![FireKeys.website];
            log(editWebsite.text);
          }
          if (userData!.containsKey(FireKeys.bio)) {
            editBio.text = userData![FireKeys.bio];
            log(editBio.text);
          }
        }
        emit(SignInSuccess());
      } else {
        log('user not found');
        emit(SignInFailure(errorMessage: 'user not found'));
      }
    });
  }

  Future signIn() async {
    try {
      emit(SignInLoading());
      await _auth.signInWithEmailAndPassword(
        email: signInEmail.text,
        password: signInPassword.text,
      );
      user = _auth.currentUser;
      emit(SignInSuccess());
    } catch (e) {
      emit(
        SignInFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future signUp() async {
    try {
      emit(SignUpLoading());
      //create the user
      await _auth.createUserWithEmailAndPassword(
        email: signUpEmail.text,
        password: signUpPassword.text,
      );
      user = _auth.currentUser;
      //add his details
      if (user != null) {
        await _addUserDetails();
      }
      emit(SignUpSuccess());
    } catch (e) {
      emit(
        SignInFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _addUserDetails() async {
    await _fireStore.collection('users').doc(user!.uid).set({
      'full name': fullName.text,
      'Username': userName.text,
      'Website': editWebsite.text,
      'bio': editBio.text,
    });
  }

  Future<void> updaterUserDetails() async {
    try {
      emit(EditProfileLoading());
      Future.delayed(const Duration(seconds: 2), () async {
        await _fireStore.collection('users').doc(user!.uid).set({
          'full name': editName.text,
          'Username': editUserName.text,
          'Website': editWebsite.text,
          'bio': editBio.text,
        }, SetOptions(merge: true));
        userData![FireKeys.fullName] = editName.text;
        userData![FireKeys.userName] = editUserName.text;
        userData![FireKeys.website] = editWebsite.text;
        userData![FireKeys.bio] = editBio.text;
        emit(EditProfileSuccess());
      });
    } catch (e) {
      emit(EditProfileFailure(errorMessage: e.toString()));
    }
  }

  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, '/login', (Route<dynamic> route) => false);
  }
}
