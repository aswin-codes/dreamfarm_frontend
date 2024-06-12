part of 'login_bloc.dart';

@immutable
class LoginEvent {}

class LoginInitialEvent extends LoginEvent {}

class LoginButtonClickedEvent extends LoginEvent {
  String email;
  String password;
  LoginButtonClickedEvent({required this.email, required this.password});
}

class ForgotPasswordClickedEvent extends LoginEvent {
  String email;
  ForgotPasswordClickedEvent({required this.email});
}

class NavigateToSignUpClickedEvent extends LoginEvent {}
