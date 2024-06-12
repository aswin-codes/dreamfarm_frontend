import 'package:dreamfarm/utilities/languages/language_constants.dart';
import 'package:dreamfarm/screens/onboarding/blocs/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dreamfarm/resources/resources.dart' as resources;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpNavigateButton extends StatelessWidget {
  LoginBloc loginBloc;
  SignUpNavigateButton({required this.loginBloc, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () => loginBloc.add(NavigateToSignUpClickedEvent()),
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: translation(context).signUpNavigate,
              style: TextStyle(
                  color: resources.secondary,
                  fontFamily: 'Sora',
                  fontSize: 16.sp)),
          TextSpan(
              text: " ${translation(context).signUp}",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: resources.secondary,
                  fontFamily: 'Sora',
                  fontSize: 16.sp))
        ])),
      ),
    );
  }
}
