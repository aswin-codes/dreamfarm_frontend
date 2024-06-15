import 'package:dreamfarm/screens/onboarding/blocs/profilepicture/profile_picture_bloc.dart';
import 'package:dreamfarm/utilities/languages/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:dreamfarm/resources/resources.dart' as resources;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContinueButton extends StatefulWidget {
  const ContinueButton({super.key});

  @override
  State<ContinueButton> createState() => _ContinueButtonState();
}

class _ContinueButtonState extends State<ContinueButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePictureBloc, ProfilePictureState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(bottom: 40.h),
          child: Center(
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      state.runtimeType == ProfilePictureUploadingState
                          ? MaterialStateProperty.all(resources.darkGrey)
                          : MaterialStateProperty.all(resources.primary),
                ),
                onPressed: state.runtimeType == ProfilePictureUploadingState
                    ? null
                    : () {
                        BlocProvider.of<ProfilePictureBloc>(context)
                            .add(ContinueButtonClicked());
                      },
                child: SizedBox(
                  height: 40.h,
                  width: 357.w,
                  child: Center(
                    child: state.runtimeType == ProfilePictureUploadingState
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
                                translation(context).continueText,
                                style: const TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 16,
                                    color: resources.light,
                                    fontWeight: FontWeight.w700),
                            ),
                  ),
                )),
          ),
        );
      },
    );
  }
}
