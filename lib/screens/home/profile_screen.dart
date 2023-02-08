import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:whats_for_dinner/screens/home/group_screen.dart';
import 'package:whats_for_dinner/screens/widgets/textfield.dart';
import 'package:whats_for_dinner/utils/assets.dart';
import 'package:whats_for_dinner/utils/strings.dart';
import 'package:whats_for_dinner/utils/style.dart';

import '../../utils/colors.dart';
import '../widgets/button.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                  Stack(
                    children: [
                      const SizedBox(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://www.ephotozine.com/articles/four-easy-ways-to-create-a-vignette-in-photoshop-18261/images/unedited.jpg"),
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
                      CustomTextField(
                        hintstyle: AppStyle.hintTextStyle,
                        fieldController: emailController,
                        hintName: "Email",
                        validationField: (p0) {
                          if (p0!.isEmpty) {
                            return "Enter Your Email";
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
            if (_formKey.currentState!.validate()) {
              Get.to(() => GroupScreen());
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
