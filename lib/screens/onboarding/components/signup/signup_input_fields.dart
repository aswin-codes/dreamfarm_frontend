import 'package:dreamfarm/screens/onboarding/blocs/signup/sign_up_bloc.dart';
import 'package:dreamfarm/utilities/languages/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:dreamfarm/resources/resources.dart' as resources;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpInputField extends StatefulWidget {
  const SignUpInputField({super.key});

  @override
  State<SignUpInputField> createState() => _SignUpInputFieldState();
}

class _SignUpInputFieldState extends State<SignUpInputField> {
  //controllers for input fields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: nameController,
          style: TextStyle(
              fontFamily: 'Sora', fontSize: 14.sp, color: resources.dark),
          decoration: InputDecoration(
            fillColor: resources.light,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            hintText: translation(context).fullName,
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
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: 55.h,
              decoration: BoxDecoration(
                color: resources.light,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    "+91",
                    style: TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 14.sp,
                        color: resources.dark),
                  ),
                  Icon(Icons.arrow_drop_down_outlined)
                ],
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: TextField(
                controller: numberController,
                style: TextStyle(
                    fontFamily: 'Sora', fontSize: 14.sp, color: resources.dark),
                decoration: InputDecoration(
                  fillColor: resources.light,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none),
                  hintText: translation(context).phoneNumber,
                  hintStyle: TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 14.sp,
                      color: resources.grey),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40.h,
        ),
        BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            return ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: state.runtimeType == SignUpLoadingState ?MaterialStateProperty.all(resources.darkGrey) : MaterialStateProperty.all(resources.primary),
                ),
                onPressed: state.runtimeType == SignUpLoadingState
                    ? null
                    : () {
                        BlocProvider.of<SignUpBloc>(context).add(
                            SignUpButtonClickedEvent(
                                email: emailController.text,
                                password: passwordController.text,
                                phoneNumber: numberController.text,
                                fullName: nameController.text));
                      },
                child: SizedBox(
                    width: 390.w,
                    height: 50.h,
                    child: Center(
                        child: state.runtimeType == SignUpLoadingState
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
                                translation(context).signUp,
                                style: const TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 16,
                                    color: resources.light,
                                    fontWeight: FontWeight.w700),
                              ))));
          },
        ),
      ],
    );
  }
}
