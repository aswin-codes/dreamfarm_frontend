import 'package:dreamfarm/screens/onboarding/components/language_widget.dart';
import 'package:dreamfarm/utilities/languages/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:dreamfarm/resources/resources.dart' as resources;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  int index = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: resources.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [LanguageWidget()],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              children: [
                buildPage(
                  context,
                  resources.cropRecommendation,
                  translation(context).cropRecommendationTitle,
                  translation(context).cropRecommendationSubTitle,
                ),
                buildPage(
                  context,
                  resources.cropDoctorBackground,
                  translation(context).cropDoctorTitle,
                  translation(context).cropDoctorSubTitle,
                ),
                buildPage(
                  context,
                  resources.communityBackground,
                  translation(context).communityTitle,
                  translation(context).communitySubTitle,
                ),
              ],
            ),
            Positioned(
                bottom: 150,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: resources.accent,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        height: 8.h,
                        width: (index == 0) ? 24.h : 8.h,
                      ),
                      Container(
                        margin:  const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: resources.accent,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        height: 8.h,
                        width: (index == 1) ? 24.h : 8.h,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: resources.accent,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        height: 8.h,
                        width: (index == 2) ? 24.h : 8.h,
                      )
                    ],
                  ),
                )),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigate to another screen or perform an action
                      Navigator.pushNamed(context, "/login");
                    },
                    child: Text(
                      translation(context).skip,
                      style: const TextStyle(
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.w700,
                        color: resources.dark,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (index == 2) {
                        Navigator.pushNamed(context, "/login");
                      } else {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: resources.primary),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      child: Text(
                        (index == 2) ? translation(context).continueText  : translation(context).next,
                        style: const TextStyle(
                          color: resources.light,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage(BuildContext context, String imagePath, String heading,
      String subHeading) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              heading,
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'Sora',
                fontWeight: FontWeight.bold,
                color: resources.secondary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              subHeading,
              style: const TextStyle(
                fontFamily: 'Sora',
                fontSize: 16,
                color: resources.dark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
