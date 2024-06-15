import 'package:dreamfarm/screens/onboarding/blocs/profilepicture/profile_picture_bloc.dart';
import 'package:dreamfarm/screens/onboarding/components/language_widget.dart';
import 'package:dreamfarm/screens/onboarding/components/profilepicture/continue_button.dart';
import 'package:dreamfarm/screens/onboarding/components/profilepicture/profile_card.dart';
import 'package:dreamfarm/screens/onboarding/components/profilepicture/profile_picture_grid.dart';
import 'package:dreamfarm/screens/onboarding/components/profilepicture/text_description.dart';
import 'package:dreamfarm/utilities/languages/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:dreamfarm/resources/resources.dart' as resources;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfilePictureScreen extends StatefulWidget {
  const ProfilePictureScreen({super.key});

  @override
  State<ProfilePictureScreen> createState() => _ProfilePictureScreenState();
}

class _ProfilePictureScreenState extends State<ProfilePictureScreen> {
  ProfilePictureBloc profilePictureBloc = ProfilePictureBloc();

  @override
  void initState() {
    // TODO: implement initState
    profilePictureBloc.add(ProfilePictureInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profilePictureBloc,
      child: Scaffold(
        backgroundColor: resources.background,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [LanguageWidget()],
        ),
        body: SingleChildScrollView(
          child: BlocConsumer<ProfilePictureBloc, ProfilePictureState>(
            buildWhen: (previous, current) =>
                current is! ProfilePictureActionState,
            listenWhen: (previous, current) =>
                current is ProfilePictureActionState,
            listener: (context, state) {
              // TODO: implement listener
              if (state is ProfilePictureUploadErrorState) {
                Fluttertoast.showToast(
                    msg: "Error : ${state.runtimeType}",
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 2,
                    backgroundColor: resources.errorRed);
              }
              if (state is NavigateToHomeScreen) {
                Navigator.pushNamed(context, '/home');
              }
            },
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    const TextDescription(),
                    SizedBox(
                      height: 40.h,
                    ),
                    const ProfilePictureGrid(),
                    SizedBox(
                      height: 40.h,
                    ),
                    ProfileCard(),
                    Spacer(),
                    ContinueButton()
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
