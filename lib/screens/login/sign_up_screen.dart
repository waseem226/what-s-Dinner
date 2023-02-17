import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:whats_for_dinner/controllers/auth_controller.dart';
import 'package:whats_for_dinner/models/user_model.dart';
import 'package:whats_for_dinner/screens/home/create_group_screen.dart';
import 'package:whats_for_dinner/screens/login/login_screen.dart';

import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/style.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70),
              Text(
                "SignUp Screen",
                style: AppStyle.numberScreenHeadingStyle,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 80),
                      CustomTextField(
                        hintstyle: AppStyle.hintTextStyle,
                        fieldController: controller.signUpEmailController,
                        hintName: "Email",
                        validationField: (p0) {
                          if ((p0 ?? '').isEmpty) {
                            return "Enter Your Email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        hintstyle: AppStyle.hintTextStyle,
                        fieldController: controller.signUpPasswordController,
                        hintName: "Password",
                        validationField: (p0) {
                          if ((p0 ?? '').isEmpty) {
                            return "Enter Password";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextButton(
                          onPressed: () {
                            Get.to(() => LoginScreen());
                          },
                          child: Text("Login"))
                    ],
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: AppBbutton(
          textColor: Colors.white,
          btnTextStyle: AppStyle.buttonText,
          bntName: "SignUp",
          btnColor: AppColors.darkPinkColor,
          btnCallBack: () {
            if (_formKey.currentState!.validate()) {
              controller.signUp(controller.signUpEmailController.text,
                  controller.signUpPasswordController.text);
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
