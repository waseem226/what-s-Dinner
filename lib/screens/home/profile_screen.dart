import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:whats_for_dinner/controllers/imagepicker_controller.dart';
import 'package:whats_for_dinner/screens/home/create_group_screen.dart';
import 'package:whats_for_dinner/screens/home/group_screen.dart';
import 'package:whats_for_dinner/screens/widgets/textfield.dart';
import 'package:whats_for_dinner/utils/assets.dart';
import 'package:whats_for_dinner/utils/strings.dart';
import 'package:whats_for_dinner/utils/style.dart';

import '../../constants/app_constants.dart';
import '../../models/user_model.dart';
import '../../utils/colors.dart';
import '../widgets/button.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ImagePickerController controller = Get.put(ImagePickerController());
  String choseValue = "Gender";
  var genderList = ["Male", "Female"];
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                AppStrings.createProfileText,
                style: AppStyle.numberScreenHeadingStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.showImagePicker(false);
                    },
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Obx(
                            () => CircleAvatar(
                              backgroundImage: controller.imagePath.isNotEmpty
                                  ? FileImage(
                                      File(controller.imagePath.toString()))
                                  : null,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 3,
                          child: Container(
                              height: 26,
                              width: 26,
                              decoration: BoxDecoration(
                                  color: AppColors.darkPinkColor,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 2, color: AppColors.whiteColor)),
                              child: ImageIcon(
                                AssetImage(
                                  "assets/images/edit_logo.png",
                                ),
                                color: AppColors.whiteColor,
                                size: 10,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      CustomTextField(
                        hintstyle: AppStyle.hintTextStyle,
                        fieldController: nameController,
                        hintName: "First Name",
                        validationField: (p0) {
                          if (p0!.isEmpty) {
                            return "Enter Your Name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        hintstyle: AppStyle.hintTextStyle,
                        fieldController: lastNameController,
                        hintName: "Last Name",
                        validationField: (p0) {
                          if (p0!.isEmpty) {
                            return "Enter Your Last Name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                        decoration: BoxDecoration(
                            color: AppColors.textFieldColor,
                            borderRadius: BorderRadius.circular(2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(choseValue,
                                style: TextStyle(color: Colors.black)),
                            DropdownButton(
                              elevation: 0,
                              iconSize: 30,
                              style: TextStyle(color: Colors.black),
                              onChanged: (value) {
                                setState(() {
                                  choseValue = value!;
                                });
                              },
                              items: genderList.map((item) {
                                return DropdownMenuItem(
                                    value: item, child: Text(item));
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 80)
                    ],
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: AppBbutton(
          textColor: Colors.white,
          btnTextStyle: AppStyle.buttonText,
          bntName: "Create",
          btnColor: AppColors.darkPinkColor,
          btnCallBack: () {
            saveProfile(AppConstants.userModel);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  saveProfile(UserModel user) async {
    if (_formKey.currentState!.validate()) {
      try {
        var userSnapshot = await FirebaseFirestore.instance
            .collection("Users")
            .doc(user.uID)
            .get();
        // Sending User to Signup details screen if the data is not in database

        DocumentReference docUser =
            FirebaseFirestore.instance.collection("Users").doc(user.uID);

        user.firstName = nameController.text;
        user.lastName = lastNameController.text;
        user.userGender = choseValue;
        print(user.toString());
        await docUser.set(user.toMap(), SetOptions(merge: true));
        AppConstants.userModel = user;

        Get.to(() => GroupScreen());
      } on FirebaseAuthException catch (e) {
        errorAlert(e.code);
      }
    }
  }
}
