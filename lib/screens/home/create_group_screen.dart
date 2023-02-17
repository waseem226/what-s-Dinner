import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:whats_for_dinner/models/group_model.dart';
import 'package:whats_for_dinner/screens/home/group_screen.dart';
import 'package:whats_for_dinner/utils/fonts.dart';

import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/style.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';
import 'add_members_screen.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  // final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  bool isEmpty = false;
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
                "Create New\nGroup",
                style: AppStyle.numberScreenHeadingStyle,
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 32),
              CustomTextField(
                hintName: "Group Name",
                fieldController: nameController,
              ),
              SizedBox(height: 16),
              Container(
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColors.textFieldColor,
                    borderRadius: BorderRadius.circular(2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add Group members",
                      style: AppStyle.disableFieldStyle,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.bottomSheet(const ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35)),
                              child: AddMembersScreen()));
                        },
                        child: Icon(Icons.add, size: 30, color: Colors.red))
                  ],
                ),
              ),
              SizedBox(height: 15),
              // Stack(
              //   children: [
              //     const SizedBox(
              //       height: 33.33,
              //       width: 33.33,
              //       child: CircleAvatar(
              //         backgroundImage: NetworkImage(
              //             "https://www.ephotozine.com/articles/four-easy-ways-to-create-a-vignette-in-photoshop-18261/images/unedited.jpg"),
              //       ),
              //     ),
              //     Positioned(
              //       top: 0,
              //       right: -5,
              //       child: Container(
              //         height: 15,
              //         width: 15,
              //         decoration: BoxDecoration(
              //             color: AppColors.darkPinkColor,
              //             borderRadius: BorderRadius.circular(15),
              //             border: Border.all(
              //                 width: 2, color: AppColors.whiteColor)),
              //         child: ImageIcon(
              //           AssetImage(
              //             "assets/images/edit_logo.png",
              //           ),
              //           color: AppColors.whiteColor,
              //           size: 10,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 80,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: groupList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5, right: 14),
                      child: Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                clipBehavior: Clip.hardEdge,
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.amber),
                                child: Image.network(
                                  groupList[index].groupImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: -7,
                                right: -4,
                                child: GestureDetector(
                                  onTap: () {
                                    print(
                                      "helo click",
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        width: 2,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.cancel,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 3.67),
                          Text(
                            groupList[index].groupName,
                            style: TextStyle(
                              fontFamily: AppFonts.urbanistRegular,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkGreyColor,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
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
            if (nameController.text.trim().isEmpty) {
              errorAlert(
                "Enter Group Name",
              );
              return;
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

errorAlert(String alertValue) {
  showOkAlertDialog(
    context: Get.context!,
    title: "Error",
    message: alertValue,
  );
}
