import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whats_for_dinner/screens/home/bottom_navigationbar_screen.dart';
import 'package:whats_for_dinner/screens/home/create_group_screen.dart';
import 'package:whats_for_dinner/screens/home/group_screen.dart';
import 'package:whats_for_dinner/screens/login/number_screen.dart';
import 'package:whats_for_dinner/screens/home/profile_screen.dart';
import 'package:whats_for_dinner/screens/onboarding/splash_screen.dart';
import 'package:whats_for_dinner/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.whiteColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
