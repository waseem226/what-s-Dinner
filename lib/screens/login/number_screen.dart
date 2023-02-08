import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:whats_for_dinner/screens/login/verification_screen.dart';
import 'package:whats_for_dinner/screens/widgets/button.dart';
import 'package:whats_for_dinner/utils/colors.dart';
import 'package:whats_for_dinner/utils/fonts.dart';
import 'package:whats_for_dinner/utils/strings.dart';
import 'package:whats_for_dinner/utils/style.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  TextEditingController countryCode = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    countryCode.text = "+1";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.white,

          ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                AppStrings.whatsYourNumber,
                style: AppStyle.numberScreenHeadingStyle,
              ),
              SizedBox(height: 10),
              Text(
                AppStrings.weWillSendYouSms,
                style: AppStyle.discripStyle,
              ),
              SizedBox(height: 30),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: AppColors.textFieldColor,
                    borderRadius: BorderRadius.circular(2)),
                child: Row(
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          controller: countryCode,
                          style: TextStyle(),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      width: 60,
                    ),
                    Text(
                      "|",
                      style:
                          TextStyle(fontSize: 25, color: Colors.grey.shade300),
                    ),
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              // SizedBox(height: 350),
            ],
          ),
        ),
      ),
      floatingActionButton: AppBbutton(
          textColor: Colors.white,
          btnTextStyle: AppStyle.buttonText,
          bntName: "Continue",
          btnColor: AppColors.darkPinkColor,
          btnCallBack: () => Get.to(() => VerificationScreen())),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
