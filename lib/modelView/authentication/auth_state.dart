part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignInSuccess extends AuthState {}

final class SignInLoading extends AuthState {}

final class SignInFailure extends AuthState {
  final String errorMessage;

  SignInFailure({required this.errorMessage});
}

final class SignUpSuccess extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpFailure extends AuthState {
  final String errorMessage;

  SignUpFailure({required this.errorMessage});
}

final class TextFieldFilled extends AuthState {}

final class EditProfileSuccess extends AuthState {}

final class EditProfileLoading extends AuthState {}

final class EditProfileFailure extends AuthState {
  final String errorMessage;

  EditProfileFailure({required this.errorMessage});
}
