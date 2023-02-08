import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:whats_for_dinner/screens/widgets/button.dart';
import 'package:whats_for_dinner/utils/fonts.dart';
import 'package:whats_for_dinner/utils/style.dart';

import '../../utils/colors.dart';

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({super.key});

  List<String> chipList = <String>[
    "Mediterranean Cuisine",
    "Japanese Food",
    "Chinese Cuisine",
    "Japanese Food",
    "Asian"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Profile", style: AppStyle.groupNameTitleStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Column(children: [
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
                    ),
                  ],
                ),
                SizedBox(height: 9),
                Text(
                  "Meritt Thomas",
                  style: AppStyle.groupNameTitleStyle,
                ),
                SizedBox(height: 9),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      color: AppColors.darkGreyColor,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "123 343 1770",
                      style: AppStyle.phoneNumberTextStyle,
                    ),
                  ],
                ),
              ]),
              SizedBox(height: 20),
              Text(
                "Favorite Cuisines",
                style: AppStyle.groupNameTitleStyle,
              ),
              SizedBox(height: 20),
              // for (int i = 0; i < chipList.length; i++)
              //   Wrap(
              //     children: [
              //       Chip(
              //           backgroundColor: AppColors.darkPinkColor,
              //           label: Text(
              //             chipList[i],
              //             style: TextStyle(
              //                 fontFamily: AppFonts.urbanistRegular,
              //                 fontSize: 12,
              //                 fontWeight: FontWeight.w400,
              //                 color: AppColors.whiteColor),
              //           ))
              //     ],
              //   ),
              Wrap(
                spacing: 7,
                children: chipList
                    .map(
                      (element) => Chip(
                        backgroundColor: AppColors.darkPinkColor,
                        label: Text(
                          element,
                          style: TextStyle(
                              fontFamily: AppFonts.urbanistRegular,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteColor),
                        ),
                      ),
                    )
                    .toList(),
              ),
              //   Wrap(
              //       children: chipList
              //           .map((element) => Chip(label: Text(element)))
              //           .toList())
              //
              // ],
            ],
          ),
        ),
      ),
      floatingActionButton: AppBbutton(
          bntName: "Save",
          btnColor: AppColors.darkPinkColor,
          btnCallBack: () {},
          btnTextStyle: TextStyle(color: Colors.white),
          textColor: AppColors.whiteColor),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
