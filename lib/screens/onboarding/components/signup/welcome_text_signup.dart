import 'package:dreamfarm/utilities/languages/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:dreamfarm/resources/resources.dart' as resources;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeTextSignUp extends StatelessWidget {
  const WelcomeTextSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translation(context).signUpPageTitle,
          style: TextStyle(
              fontFamily: 'Sora',
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: resources.dark),
        ),
        Text(
          translation(context).signUpPageSubTitle,
          style: TextStyle(
              fontFamily: 'Sora', fontSize: 16.sp, color: resources.dark),
        )
      ],
    );
  }
}
