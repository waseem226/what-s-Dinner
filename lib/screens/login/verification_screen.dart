import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:whats_for_dinner/screens/home/profile_screen.dart';
import 'package:whats_for_dinner/utils/fonts.dart';

import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/style.dart';
import '../widgets/button.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 40,
          color: Color.fromARGB(255, 4, 120, 221),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
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
                AppStrings.verificationCodeText,
                style: AppStyle.numberScreenHeadingStyle,
              ),
              SizedBox(height: 10),
              Text(
                AppStrings.enterVerifiCodeText,
                style: AppStyle.discripStyle,
              ),
              SizedBox(height: 30),
              Pinput(
                length: 6,

                // defaultPinTheme: defaultPinTheme,
                // focusedPinTheme: focusedPinTheme,
                // submittedPinTheme: submittedPinTheme,
                validator: (s) {
                  return s == '2222' ? null : 'Pin is incorrect';
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        AppStrings.resendCodeText,
                        style: AppStyle.resendButtonTextStyle,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: AppBbutton(
          textColor: Colors.white,
          btnTextStyle: AppStyle.buttonText,
          bntName: "Continue",
          btnColor: AppColors.darkPinkColor,
          btnCallBack: () => Get.to(() => ProfileScreen())),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
