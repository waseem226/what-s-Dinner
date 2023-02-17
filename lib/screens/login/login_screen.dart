import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:whats_for_dinner/controllers/auth_controller.dart';
import 'package:whats_for_dinner/screens/home/create_group_screen.dart';
import 'package:whats_for_dinner/screens/home/profile_screen.dart';
import 'package:whats_for_dinner/screens/login/sign_up_screen.dart';

import '../../utils/colors.dart';
import '../../utils/style.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // FirebaseAuth _auth = FirebaseAuth.instance;
  AuthController controller = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70),
              Text(
                "Login Screen",
                style: AppStyle.numberScreenHeadingStyle,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 80),
                      CustomTextField(
                        hintstyle: AppStyle.hintTextStyle,
                        fieldController: controller.loginEmailController,
                        hintName: "Email",
                        validationField: (p0) {
                          if (p0!.isEmpty) {
                            return "Enter Your Email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        hintstyle: AppStyle.hintTextStyle,
                        fieldController: controller.loginPasswordController,
                        hintName: "Password",
                        validationField: (p0) {
                          if (p0!.isEmpty) {
                            return "Enter Password";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextButton(
                          onPressed: () {
                            Get.to(() => SignUpScreen());
                          },
                          child: Text("SingUp"))
                    ],
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: AppBbutton(
          textColor: Colors.white,
          btnTextStyle: AppStyle.buttonText,
          bntName: "login",
          btnColor: AppColors.darkPinkColor,
          btnCallBack: () {
            if (_formKey.currentState!.validate()) {
              controller.login(controller.loginEmailController.text,
                  controller.loginPasswordController.text);
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
