import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:insgram_clone/model/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();

  UserModel _userFromFirebase(User user) {
    return UserModel(uid: user.uid);
  }

  textFieldFilled() {
    emit(TextFieldFilled());
  }

  Future signIn() async {
    try {
      emit(SignInLoading());
      _auth.signInWithEmailAndPassword(
        email: signInEmail.text,
        password: signInPassword.text,
      );
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
      _auth.createUserWithEmailAndPassword(
        email: signUpEmail.text,
        password: signUpPassword.text,
      );
      emit(SignUpSuccess());
    } catch (e) {
      emit(
        SignInFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
