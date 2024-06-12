part of 'login_bloc.dart';

@immutable
class LoginState {}

class LoginInitial extends LoginState {}

class LoginActionState extends LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginActionState {}

class LoginSuccessfulState extends LoginActionState {}

class LoginErrorState extends LoginActionState {
  String message;
  int code;
  LoginErrorState({required this.message, required this.code});
}

class ForgotPasswordLoadingState extends LoginActionState {}

class ForgotPasswordSuccessState extends LoginActionState {}

class ForgotPasswordErrorState extends LoginActionState {
  String message;
  int code;
  ForgotPasswordErrorState({required this.message, required this.code});
}

class NavigateToSignUpScreenState extends LoginActionState {}
