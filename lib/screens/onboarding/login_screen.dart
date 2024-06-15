import 'package:dreamfarm/screens/onboarding/blocs/login/login_bloc.dart';
import 'package:dreamfarm/screens/onboarding/components/language_widget.dart';
import 'package:dreamfarm/screens/onboarding/components/login/login_input_fields.dart';
import 'package:dreamfarm/screens/onboarding/components/login/signup_navigate_button.dart';
import 'package:dreamfarm/screens/onboarding/components/login/welcome_text_login.dart';
import 'package:flutter/material.dart';
import 'package:dreamfarm/resources/resources.dart' as resources;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc loginBloc = LoginBloc();

  @override
  void initState() {
    loginBloc.add(LoginInitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginBloc,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [LanguageWidget()],
        ),
        backgroundColor: resources.background,
        body: BlocConsumer<LoginBloc, LoginState>(
          listenWhen: (previous, current) => current is LoginActionState,
          buildWhen: (previous, current) => current is! LoginActionState,
          listener: (context, state) {
            if (state is NavigateToSignUpScreenState) {
              Navigator.pushReplacementNamed(context, '/signup');
            } else if (state is LoginErrorState) {
              Fluttertoast.showToast(
                  msg: state.message,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 2,
                  backgroundColor: resources.errorRed);
            } else if (state is LoginSuccessfulState) {
              Fluttertoast.showToast(
                  msg: "Hurray! Login Successful",
                  textColor: resources.dark,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 2,
                  backgroundColor: resources.background);
              Navigator.pushNamedAndRemoveUntil(
                  context, "/home", (route) => false);
            } else if (state is ForgotPasswordErrorState) {
              Fluttertoast.showToast(
                  msg: state.message,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 2,
                  backgroundColor: resources.errorRed);
            } else if (state is ForgotPasswordSuccessState) {
              Fluttertoast.showToast(
                  msg:
                      "A password reset link has been sent to your registered email. Reset the password and try again.",
                  textColor: resources.dark,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 2,
                  backgroundColor: resources.background);
            }
          },
          builder: (context, state) {
            if (state is LoginInitialState) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height),
                  child: IntrinsicHeight(
                    child: Stack(
                      children: [
                        Image.asset(
                          resources.backgroundImage,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: resources.background,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.r),
                                    topRight: Radius.circular(25.r))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 20.h),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const WelcomeLoginText(),
                                  SizedBox(height: 20.h),
                                  LoginInputField(),
                                  SizedBox(height: 20.h),
                                  SignUpNavigateButton(loginBloc: loginBloc),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
