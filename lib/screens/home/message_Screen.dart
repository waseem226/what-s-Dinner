import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:whats_for_dinner/utils/strings.dart';

import '../../models/group_model.dart';
import '../../utils/colors.dart';
import '../../utils/style.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

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
              AppStrings.message,
              style: AppStyle.appBarTitleStyle,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: groupList.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        subtitle: Text(
                          groupList[index].groupDis,
                          style: AppStyle.groupDetailSubStyle,
                        ),
                        trailing: Text(
                          "Yesterday",
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
        ],
      ),
    );
  }
}
