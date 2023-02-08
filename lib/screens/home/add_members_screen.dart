import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:whats_for_dinner/screens/widgets/button.dart';
import 'package:whats_for_dinner/utils/colors.dart';
import 'package:whats_for_dinner/utils/fonts.dart';

import '../../models/group_model.dart';
import '../../utils/style.dart';
import '../widgets/textfield.dart';

class AddMembersScreen extends StatefulWidget {
  const AddMembersScreen({super.key});

  @override
  State<AddMembersScreen> createState() => _AddMembersScreenState();
}

class _AddMembersScreenState extends State<AddMembersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 5,
                    width: Get.width / 15,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2.5)),
                  ),
                ],
              ),
              SizedBox(height: 22),
              Text(
                "Add members",
                style: TextStyle(
                  fontFamily: AppFonts.urbanistBold,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkGreyColor,
                ),
              ),
              SizedBox(height: 8),
              CustomTextField(
                hintName: "Search Members",
                suffix: Icon(
                  Icons.search,
                  color: AppColors.greyColor,
                ),
                onChanged: (p0) {},
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                    itemCount: groupList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  groupList[index].groupImage,
                                  scale: 1),
                            ),
                            title: Text(
                              groupList[index].groupName,
                              style: AppStyle.groupNameTitleStyle,
                            ),
                            trailing: Text(
                              groupList[index].groupName,
                              style: AppStyle.groupDetailSubStyle,
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AppBbutton(
        bntName: "Add Members",
        btnColor: AppColors.darkPinkColor,
        btnCallBack: () {},
        btnTextStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
