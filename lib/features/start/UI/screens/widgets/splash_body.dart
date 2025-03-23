import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_assets.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();

    // Add a timer that will expire after 3 seconds.
    Timer(Duration(seconds: 5), () {
      // Redirect to next page after counter ends
      Navigator.pushReplacementNamed(context, "home_screen");
      // AwesomeNotifications().requestPermissionToSendNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(width: 170, height: 170, AppAssets.logo));
  }
}
