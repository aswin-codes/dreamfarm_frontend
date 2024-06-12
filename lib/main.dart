import 'package:dreamfarm/screens/onboarding/info_screen.dart';
import 'package:dreamfarm/screens/onboarding/splash_screen.dart';
import 'package:dreamfarm/utilities/languages/language_constants.dart';
import 'package:dreamfarm/screens/onboarding/login_screen.dart';
import 'package:dreamfarm/screens/onboarding/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dreamfarm/resources/resources.dart' as resources;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  //TODO: implement setLocale
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // TODO: define local and setLocale and on didChangedependies initilas
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dream Farm',
          theme: ThemeData(
            fontFamily: 'PJS',
            primaryColor: resources.primary,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          routes: {
            "/login": (context) => const LoginScreen(),
            "/signup": (context) => const SignUpScreen(),
            "/splash": (context) => const SplashScreen(),
            "/info" : (context) => const InfoScreen()
          },
          initialRoute: "/info",
          locale: _locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}
