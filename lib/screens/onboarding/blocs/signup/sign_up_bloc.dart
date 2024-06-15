import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dreamfarm/screens/onboarding/data/repository/sign_up_repository.dart';
import 'package:dreamfarm/utilities/modals/custom_exception.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpInitialEvent>(signUpInitialEvent);
    on<NavigateToLoginButtonClickedEvent>(navigateToLoginButtonClickedEvent);
    on<SignUpButtonClickedEvent>(signUpButtonClickedEvent);
  }

  SignUpRepository _signUpRepository = SignUpRepository();

  FutureOr<void> signUpInitialEvent(
      SignUpInitialEvent event, Emitter<SignUpState> emit) {
    emit(SignUpInitialState());
  }

  FutureOr<void> navigateToLoginButtonClickedEvent(
      NavigateToLoginButtonClickedEvent event, Emitter<SignUpState> emit) {
    emit(NavigateToLoginState());
  }

  FutureOr<void> signUpButtonClickedEvent(
      SignUpButtonClickedEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpLoadingState());
    try {
      await _signUpRepository.createAccount(
          event.fullName, event.email, event.password, event.phoneNumber);
      emit(SignUpSuccessState());
    } on CustomException catch (e) {
      emit(SignUpErrorState(message: e.message, code: e.code));
    }
  }
}
