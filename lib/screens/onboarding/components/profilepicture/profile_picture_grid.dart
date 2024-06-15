import 'package:dreamfarm/screens/onboarding/blocs/profilepicture/profile_picture_bloc.dart';
import 'package:dreamfarm/screens/onboarding/components/profilepicture/bottom_image_source.dart';
import 'package:flutter/material.dart';
import 'package:dreamfarm/resources/resources.dart' as resources;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePictureGrid extends StatefulWidget {
  const ProfilePictureGrid({super.key});

  @override
  State<ProfilePictureGrid> createState() => _ProfilePictureGridState();
}

class _ProfilePictureGridState extends State<ProfilePictureGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.zero,
      crossAxisCount: 3,
      childAspectRatio: 1,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
            InkWell(
              onTap: () => showImageSource(context),
              child: Image(
                image: AssetImage(resources.cameraIcon),
                height: 80.h,
              ),
            ),
          ] +
          resources.profilePictures
              .map((e) => InkWell(
                onTap: () => BlocProvider.of<ProfilePictureBloc>(context).add(ExistingAvatarClicked(url: e)),
                child: Image(image: NetworkImage(e), height: 80.h,)))
              .toList(),
    );
  }
}
