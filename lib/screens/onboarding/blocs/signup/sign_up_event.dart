part of 'sign_up_bloc.dart';

@immutable
class SignUpEvent {}

class SignUpInitialEvent extends SignUpEvent {}

class SignUpButtonClickedEvent extends SignUpEvent {
  String email;
  String fullName;
  String phoneNumber;
  String password;
  SignUpButtonClickedEvent(
      {required this.email,
      required this.password,
      required this.fullName,
      required this.phoneNumber});
}

class NavigateToLoginButtonClickedEvent extends SignUpEvent {}
