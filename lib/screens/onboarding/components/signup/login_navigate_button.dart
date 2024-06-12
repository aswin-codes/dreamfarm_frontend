import 'package:dreamfarm/utilities/languages/language_constants.dart';
import 'package:dreamfarm/screens/onboarding/blocs/signup/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dreamfarm/resources/resources.dart' as resources;

class LoginNavigateButton extends StatelessWidget {
  SignUpBloc signUpBloc;
  LoginNavigateButton({required this.signUpBloc, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () => signUpBloc.add(NavigateToLoginButtonClickedEvent()),
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: translation(context).loginNavigate,
                style: TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 16.sp,
                    color: resources.secondary)),
            TextSpan(
                text: " ${translation(context).login}",
                style: TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 16.sp,
                    color: resources.secondary,
                    fontWeight: FontWeight.w700)),
          ]),
        ),
      ),
    );
  }
}
