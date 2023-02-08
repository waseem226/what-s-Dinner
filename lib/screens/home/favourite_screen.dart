import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:whats_for_dinner/models/group_model.dart';

import '../../utils/strings.dart';
import '../../utils/style.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 30),
            child: Text(
              AppStrings.favourite,
              style: AppStyle.appBarTitleStyle,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 18),
              itemCount: groupList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 3,
                    shadowColor: Colors.white,
                    color: Colors.white,
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
                            backgroundImage: NetworkImage(
                                groupList[index].groupImage,
                                scale: 1),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          groupList[index].groupName,
                          style: AppStyle.groupNameTitleStyle,
                        ),
                        SizedBox(height: 5),
                        Text(
                          groupList[index].groupDis,
                          style: AppStyle.groupNameDisStyle,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
