import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whats_for_dinner/screens/login/number_screen.dart';
import 'package:whats_for_dinner/screens/login/sign_up_screen.dart';
import 'package:whats_for_dinner/screens/widgets/button.dart';
import 'package:whats_for_dinner/utils/colors.dart';
import 'package:whats_for_dinner/utils/strings.dart';
import 'package:whats_for_dinner/utils/style.dart';
import '../../utils/assets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.darkPinkColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 122),
                  child: Image.asset(
                    AppAssets.splashLogo,
                    height: 232,
                    width: 232,
                  ),
                ),
                SizedBox(height: 100),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          AppStrings.welcomeText,
                          style: AppStyle.welcomeStyle,
                        ),
                        SizedBox(width: 10),
                        ImageIcon(
                          AssetImage(AppAssets.handWave),
                          size: 48,
                        )
                      ],
                    ),
                    Text(
                      AppStrings.welcomeHeading,
                      style: AppStyle.welcomeHeadingStyle,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                AppBbutton(
                    textColor: Colors.black,
                    bntName: AppStrings.phoneLogin,
                    btnTextStyle: AppStyle.buttonText,
                    btnColor: AppColors.whiteColor,
                    btnCallBack: () => Get.to(() => SignUpScreen())),
                SizedBox(height: 43),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text:
                            "By selecting one or the other, you are agreeing to the ",
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade400)),
                    TextSpan(
                      text: "Terms of Services & Privacy Policy",
                      style: AppStyle.termsConditionTextStyle,
                      recognizer: new TapGestureRecognizer()..onTap = () {},
                    )
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}
