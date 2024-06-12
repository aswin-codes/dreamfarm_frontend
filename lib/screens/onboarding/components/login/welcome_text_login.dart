import 'package:dreamfarm/utilities/languages/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:dreamfarm/resources/resources.dart' as resources;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeLoginText extends StatelessWidget {
  const WelcomeLoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translation(context).loginPageTile,
          style: TextStyle(
              color: resources.dark,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Sora'),
        ),
        Text(
          translation(context).loginPageSubTitle,
          style: TextStyle(
            fontFamily: 'Sora',
            fontSize: 16.sp,
            color: resources.dark,
          ),
        )
      ],
    );
  }
}
