import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:whats_for_dinner/models/group_model.dart';
import 'package:whats_for_dinner/screens/home/create_group_screen.dart';
import 'package:whats_for_dinner/screens/home/group_detail.dart';
import 'package:whats_for_dinner/screens/home/myprofile_screen.dart';
import 'package:whats_for_dinner/utils/colors.dart';
import 'package:whats_for_dinner/utils/style.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var myList = groupList;
    // final List<Map> myProducts = List.generate(100,
    //         (index) => {"id": index, "name": "Friends", "dis": "11 members"})
    //     .toList();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85,
        leadingWidth: 90,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(17),
          child: GestureDetector(
            onTap: () {
              Get.to(() => MyProfileScreen());
              print("hello Profile");
            },
            child: Container(
              // margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 2,
                      blurRadius: 20,
                    )
                  ]),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.ephotozine.com/articles/four-easy-ways-to-create-a-vignette-in-photoshop-18261/images/unedited.jpg",
                    scale: 1),
              ),
            ),
          ),
        ),
        title: Text(
          "My Groups",
          style: AppStyle.appBarTitleStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: IconButton(
                onPressed: () {
                  Get.to(() => CreateGroupScreen());
                },
                icon: Icon(
                  Icons.add,
                  size: 30,
                  color: AppColors.darkPinkColor,
                )),
          )
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, crossAxisSpacing: 20, mainAxisSpacing: 18),
        itemCount: myList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => GroupDetailScreen());
            },
            child: Card(
              elevation: 3,
              shadowColor: Colors.white,
              color: Colors.white,
              child: Container(
                height: 160,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                    boxShadow: [
                      // BoxShadow(
                      //   color: Colors.grey.withOpacity(.9),
                      //   spreadRadius: 3,
                      //   blurRadius: 0.1,
                      //   blurStyle: BlurStyle.outer,
                      // )
                    ]),
                child: Column(
                  children: [
                    SizedBox(height: 19.5),
                    Container(
                      height: 75,
                      width: 75,
                      // margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400,
                                spreadRadius: 2,
                                blurRadius: 20,
                                blurStyle: BlurStyle.outer)
                          ]),

                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(myList[index].groupImage, scale: 1),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      myList[index].groupName,
                      style: AppStyle.groupNameTitleStyle,
                    ),
                    SizedBox(height: 5),
                    Text(
                      myList[index].groupDis,
                      style: AppStyle.groupNameDisStyle,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
