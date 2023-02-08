import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:whats_for_dinner/models/group_model.dart';

import '../../utils/colors.dart';
import '../../utils/style.dart';

class GroupDetailScreen extends StatelessWidget {
  GroupDetailScreen({super.key});

  // var adduser = groupList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Group Detail",
          style: AppStyle.groupNameTitleStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
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
            Text(
              "Created at: 20/04/2022",
              style: AppStyle.groupDetailSubStyle,
            ),
            SizedBox(height: 17),
            Container(
              height: 1,
              width: double.infinity,
              color: AppColors.greyColor,
            ),
            SizedBox(height: 5),
            ListTile(
              shape: Border(
                bottom: BorderSide(width: 0.5, color: AppColors.greyColor),
              ),
              leading: Text(
                "Total Sessions",
                style: AppStyle.groupNameTitleStyle,
              ),
              trailing: Text(
                "05",
                style: AppStyle.groupDetailSubStyle,
              ),
            ),
            SizedBox(height: 15),
            ListTile(
              leading: Text(
                "Members",
                style: AppStyle.groupNameTitleStyle,
              ),
              trailing: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.person_add_alt_1,
                  color: AppColors.darkPinkColor,
                ),
              ),
            ),
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
                            "Creater",
                            style: AppStyle.groupDetailSubStyle,
                          ),
                        ),
                        Container(
                          height: .5,
                          width: double.infinity,
                          color: AppColors.greyColor,
                        ),
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 30),
              child:
                  Text("Total Members: 5", style: AppStyle.groupDetailSubStyle),
            )
          ],
        ),
      ),
    );
  }
}
