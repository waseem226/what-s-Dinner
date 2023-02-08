import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whats_for_dinner/screens/onboarding/welcome_screen.dart';
import 'package:whats_for_dinner/utils/assets.dart';
import 'package:whats_for_dinner/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), (() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPinkColor,
      body: Center(
        child: Container(
          height: 232,
          width: 232,
          child: Image.asset(AppAssets.splashLogo),
        ),
      ),
    );
  }
}
