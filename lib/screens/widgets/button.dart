import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whats_for_dinner/utils/colors.dart';
import 'package:whats_for_dinner/utils/strings.dart';
import 'package:whats_for_dinner/utils/style.dart';

class AppBbutton extends StatelessWidget {
  // const AppBbutton({super.key});
  final String bntName;
  final Color btnColor;
  final Color? textColor;
  final VoidCallback btnCallBack;
  final TextStyle? btnTextStyle;

  const AppBbutton(
      {super.key,
      required this.bntName,
      required this.btnColor,
      required this.btnCallBack,
      this.btnTextStyle,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 9 * 8,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: btnColor),
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPressed: () {
            btnCallBack();
          },
          child: Text(bntName, style: btnTextStyle!.copyWith(color: textColor)),
        ));
  }
}
