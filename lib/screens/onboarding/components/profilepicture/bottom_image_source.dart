import 'package:dreamfarm/screens/onboarding/blocs/profilepicture/profile_picture_bloc.dart';
import 'package:dreamfarm/utilities/languages/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:dreamfarm/resources/resources.dart' as resources;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

Future<void> showImageSource(BuildContext context) async {
  showBottomSheet(
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.r),
        topRight: Radius.circular(16.r),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return Container(
        color: resources.primary,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 350.w,
                  child: Text(
                    translation(context).selectFrom,
                    style: TextStyle(
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold,
                      color: resources.light,
                      fontSize: 24.sp,
                    ),
                  ),
                ),
                InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(
                      Icons.close,
                      color: resources.light,
                    )),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          BlocProvider.of<ProfilePictureBloc>(context).add(
                              ImageUploadButtonClickedEvent(
                                  imageSource: ImageSource.camera));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: resources.background,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          height: 100.h,
                          child: Center(
                            child: Image(
                              image: AssetImage(resources.orangeCameraIcon),
                              height: 65.h,
                              width: 65.h,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        translation(context).camera,
                        style: TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: resources.light,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          BlocProvider.of<ProfilePictureBloc>(context).add(
                              ImageUploadButtonClickedEvent(
                                  imageSource: ImageSource.gallery));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: resources.background,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          height: 100.h,
                          child: Center(
                            child: Image(
                              image: AssetImage(resources.orangeGalleryIcon),
                              height: 65.h,
                              width: 65.h,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        translation(context).gallery,
                        style: TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: resources.light,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
