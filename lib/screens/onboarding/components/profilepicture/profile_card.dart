import 'package:dreamfarm/screens/onboarding/blocs/profilepicture/profile_picture_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dreamfarm/resources/resources.dart' as resources;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePictureBloc, ProfilePictureState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case ProfilePictureSelectedState:
            final successState = state as ProfilePictureSelectedState;
            return Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 300.w),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: resources.accent,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Aswin Raaj P S",
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: resources.light),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "+91 123456789",
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: resources.light),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "aswinraaj.ps@gmail.com",
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: resources.light),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Center(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: NetworkImage(successState.url),
                            height: 65,
                            width: 65,
                            fit: BoxFit.cover,
                          ),
                        )))
                  ],
                ),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
