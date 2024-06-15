import 'package:dreamfarm/utilities/firebase_auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:dreamfarm/resources/resources.dart' as resources;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: resources.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("DreamFarm"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await Auth().signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/splash", (route) => false);
            },
            child: Text("Log Out")),
      ),
    );
  }
}
