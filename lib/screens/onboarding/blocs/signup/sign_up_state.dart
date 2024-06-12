part of 'sign_up_bloc.dart';

@immutable
class SignUpState {}

class SignUpActionState extends SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpActionState {}

class SignUpSuccessState extends SignUpActionState {}

class SignUpErrorState extends SignUpActionState {
  String message;
  int code;
  SignUpErrorState({required this.message, required this.code});
}

class NavigateToLoginState extends SignUpActionState {}
