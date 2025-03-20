import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:insgram_clone/view/core/constants/cloud_service_keys.dart';

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

  TextEditingController editEmail = TextEditingController();

  User? user;

  void textFieldFilled() {
    emit(TextFieldFilled());
  }

  void toggleObscureText() {
    emit(PasswordObscured());
  }

  Map<String, dynamic>? userData;

  checkForUser() {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        emit(SignInLoading());
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
          }
          if (userData!.containsKey(FireKeys.bio)) {
            editBio.text = userData![FireKeys.bio];
          }
          editEmail.text = user.email.toString();
        }
        emit(UserPresent());
      } else {
        log('user not found');
        emit(UserLoggedOut(errorMessage: 'user not found'));
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
      signInEmail.clear();
      signInPassword.clear();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-credential':
          emit(
            SignInFailure(
              errorMessage: 'email or password is invalid',
            ),
          );
        default:
          emit(
            SignInFailure(
              errorMessage: 'something went wrong,please try again',
            ),
          );
      }
    } catch (e) {
      emit(
        SignInFailure(
          errorMessage: 'something went wrong,please try again',
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
      signUpEmail.clear();
      signUpPassword.clear();
      fullName.clear();
      userName.clear();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          emit(
            SignUpFailure(
              errorMessage: 'An account already exists for that email.',
            ),
          );
        case 'invalid-email':
          emit(
            SignUpFailure(
              errorMessage: 'The email address is not valid.',
            ),
          );
        case 'invalid-credential':
          emit(
            SignUpFailure(
              errorMessage: 'email or password is invalid',
            ),
          );
        default:
          log(e.code.toString());
          emit(
            SignUpFailure(
              errorMessage: 'something went wrong,please try again',
            ),
          );
      }
    } catch (e) {
      emit(
        SignUpFailure(
          errorMessage: 'something went wrong,please try again',
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
      'NormalizedUserName': userName.text.toLowerCase(),
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
          'NormalizedUserName': editUserName.text.toLowerCase(),
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
    final navigator = Navigator.of(context);
    await _auth.signOut();
    navigator.pushNamedAndRemoveUntil(
      '/start',
      (Route<dynamic> route) => false,
    );
  }
}

// void addRandomUsers(int count) {
//   for (int i = 0; i < count; i++) {
//     String firstName = randomAlpha(5);
//     String lastName = randomAlpha(5);
//     String bio = randomAlpha(20);
//
//     Map<String, String> userData = {
//       FireKeys.fullName: firstName,
//       FireKeys.userName: lastName,
//       FireKeys.bio: bio,
//       FireKeys.userNameNormalized: lastName.toLowerCase(),
//     };
//
//     _fireStore.collection('users').add(userData).then((_) {
//       print('Added user: $firstName');
//     });
//   }
// }
