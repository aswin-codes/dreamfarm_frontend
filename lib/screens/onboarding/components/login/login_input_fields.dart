import 'package:dreamfarm/screens/onboarding/blocs/login/login_bloc.dart';
import 'package:dreamfarm/utilities/languages/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:dreamfarm/resources/resources.dart' as resources;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginInputField extends StatefulWidget {
  const LoginInputField({super.key});

  @override
  State<LoginInputField> createState() => _LoginInputFieldState();
}

class _LoginInputFieldState extends State<LoginInputField> {
  //controllers for input fields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //local state variables
  bool isPasswordVisible = false;

  //function to toggle the password visibility
  void toggleVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,
          style: TextStyle(
              fontFamily: 'Sora', fontSize: 14.sp, color: resources.dark),
          decoration: InputDecoration(
            fillColor: resources.light,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            hintText: translation(context).email,
            hintStyle: TextStyle(
                fontFamily: 'Sora', fontSize: 14.sp, color: resources.grey),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        TextField(
          controller: passwordController,
          obscureText: !isPasswordVisible,
          style: TextStyle(
              fontFamily: 'Sora', fontSize: 14.sp, color: resources.dark),
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () => toggleVisibility(),
              child: Icon(
                isPasswordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: resources.grey,
              ),
            ),
            fillColor: resources.light,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            hintText: translation(context).password,
            hintStyle: TextStyle(
                fontFamily: 'Sora', fontSize: 14.sp, color: resources.grey),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Align(
          alignment: Alignment.topRight,
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return InkWell(
                onTap: () => BlocProvider.of<LoginBloc>(context).add(
                    ForgotPasswordClickedEvent(email: emailController.text)),
                child: Text(
                  translation(context).forgotPassword,
                  style: const TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 14,
                      color: resources.secondary),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: state.runtimeType == LoginLoadingState
                      ? MaterialStateProperty.all(resources.darkGrey)
                      : MaterialStateProperty.all(resources.primary),
                ),
                onPressed: state.runtimeType == LoginLoadingState
                    ? null
                    : () {
                        BlocProvider.of<LoginBloc>(context)
                            .add(LoginButtonClickedEvent(
                          email: emailController.text,
                          password: passwordController.text,
                        ));
                      },
                child: SizedBox(
                    width: 390.w,
                    height: 50.h,
                    child: Center(
                        child: state.runtimeType == LoginLoadingState
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 30.h,
                                    width: 30.h,
                                    child: const CircularProgressIndicator(
                                        color: resources.light),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "${translation(context).loading}...",
                                    style: const TextStyle(
                                        fontFamily: 'Sora',
                                        fontSize: 16,
                                        color: resources.light,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              )
                            : Text(
                                translation(context).login,
                                style: const TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 16,
                                    color: resources.light,
                                    fontWeight: FontWeight.w700),
                              ))));
          },
        )
      ],
    );
  }
}
