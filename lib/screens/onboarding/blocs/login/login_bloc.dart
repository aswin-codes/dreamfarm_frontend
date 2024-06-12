import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dreamfarm/screens/onboarding/data/repository/login_repository.dart';
import 'package:dreamfarm/utilities/modals/custom_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginInitialEvent>(loginInitialEvent);
    on<NavigateToSignUpClickedEvent>(navigateToSignUpClickedEvent);
    on<LoginButtonClickedEvent>(loginButtonClickedEvent);
    on<ForgotPasswordClickedEvent>(forgotPasswordClickedEvent);
  }

  LoginRepository _loginRepository = LoginRepository();

  FutureOr<void> loginInitialEvent(
      LoginInitialEvent event, Emitter<LoginState> emit) {
    emit(LoginInitialState());
  }

  FutureOr<void> navigateToSignUpClickedEvent(
      NavigateToSignUpClickedEvent event, Emitter<LoginState> emit) {
    emit(NavigateToSignUpScreenState());
  }

  FutureOr<void> loginButtonClickedEvent(
      LoginButtonClickedEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    try {
      await _loginRepository.loginAccount(event.email, event.password);
      emit(LoginSuccessfulState());
    } on CustomException catch (e) {
      emit(LoginErrorState(message: e.message, code: e.code));
    }
  }

  FutureOr<void> forgotPasswordClickedEvent(
      ForgotPasswordClickedEvent event, Emitter<LoginState> emit) async {
    emit(ForgotPasswordLoadingState());
    try {
      await _loginRepository.sendPasswordResetLink(event.email);
      emit(ForgotPasswordSuccessState());
    } on CustomException catch (e) {
      emit(ForgotPasswordErrorState(message: e.message, code: e.code));
    }
  }
}
