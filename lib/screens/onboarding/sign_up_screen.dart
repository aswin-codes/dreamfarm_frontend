import 'package:dreamfarm/screens/onboarding/blocs/signup/sign_up_bloc.dart';
import 'package:dreamfarm/screens/onboarding/components/language_widget.dart';
import 'package:dreamfarm/screens/onboarding/components/signup/login_navigate_button.dart';
import 'package:dreamfarm/screens/onboarding/components/signup/signup_input_fields.dart';
import 'package:dreamfarm/screens/onboarding/components/signup/welcome_text_signup.dart';
import 'package:flutter/material.dart';
import 'package:dreamfarm/resources/resources.dart' as resources;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpBloc signUpBloc = SignUpBloc();

  @override
  void initState() {
    super.initState();
    signUpBloc.add(SignUpInitialEvent());
  }

  @override
  void dispose() {
    signUpBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => signUpBloc,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [LanguageWidget()],
        ),
        backgroundColor: resources.background,
        body: BlocConsumer<SignUpBloc, SignUpState>(
          listenWhen: (previous, current) => current is SignUpActionState,
          buildWhen: (previous, current) => current is! SignUpActionState,
          listener: (context, state) {
            if (state is NavigateToLoginState) {
              Navigator.pushReplacementNamed(context, "/login");
            } else if (state is SignUpErrorState) {
              Fluttertoast.showToast(
                  msg: state.message,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 2,
                  backgroundColor: resources.errorRed);
            } else if (state is SignUpSuccessState) {
              Fluttertoast.showToast(
                  msg: "Hurray! Your account has been successfully created",
                  textColor: resources.dark,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 2,
                  backgroundColor: resources.background);
            }
          },
          builder: (context, state) {
            if (state is SignUpInitialState) {
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
                                  const WelcomeTextSignUp(),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  const SignUpInputField(),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  LoginNavigateButton(signUpBloc: signUpBloc),
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
