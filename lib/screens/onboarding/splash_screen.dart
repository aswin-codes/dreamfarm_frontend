import 'package:dreamfarm/screens/onboarding/blocs/splash/splash_bloc.dart';
import 'package:dreamfarm/utilities/session_manager/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:dreamfarm/resources/resources.dart' as resources;
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashBloc splashBloc = SplashBloc();
  @override
  void initState() {
    // TODO: implement initState
    splashBloc.add(SplashInitialEvent());
    SessionManager sm = SessionManager();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      bloc: splashBloc,
      listener: (context, state) {
        // TODO: implement listener
        if (state is NavigateToInfoScreen) {
          Navigator.pushReplacementNamed(context, "/info");
        }
      },
      child: Scaffold(
        backgroundColor: resources.background,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Center(
            child: Image(
              image: AssetImage(resources.dreamFarmLogo),
              height: 70,
              width: 70,
            ),
          ),
        ),
      ),
    );
  }
}
