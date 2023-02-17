import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whats_for_dinner/constants/app_constants.dart';
import 'package:whats_for_dinner/models/user_model.dart';
import 'package:whats_for_dinner/screens/home/create_group_screen.dart';

import '../screens/home/profile_screen.dart';
import '../screens/login/login_screen.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  // SIGN-UP AUTHENTICATION //

  Future<void> signUp(String email, String password) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: signUpEmailController.text,
        password: signUpPasswordController.text,
      );
      // Getting User Collection
      var userSnapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(credential.user?.uid ?? '')
          .get();
      // Sending User to Signup details screen if the data is not in database
      if (!userSnapshot.exists) {
        DocumentReference docUser = FirebaseFirestore.instance
            .collection("Users")
            .doc(credential.user?.uid);

        var user = AppConstants.userModel;
        user.userEmail = credential.user?.email;
        user.uID = credential.user?.uid;

        await docUser.set(user.toMap(), SetOptions(merge: true));
        AppConstants.userModel = user;
        log(AppConstants.userModel.toString());
        Get.to(() => LoginScreen());
      }
      Get.to(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      errorAlert(e.code);
    }
  }

  // LOGIN AUTHENTICATION //

  Future<void> login(String email, String password) async {
    try {
      final loginCredential = await auth.signInWithEmailAndPassword(
          email: loginEmailController.text,
          password: loginPasswordController.text);

      Get.to(() => ProfileScreen());
    } on FirebaseAuthException catch (e) {
      errorAlert(e.code);
    }
  }
}
