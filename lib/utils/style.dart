import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whats_for_dinner/utils/colors.dart';
import 'package:whats_for_dinner/utils/fonts.dart';

class AppStyle {
  static TextStyle welcomeStyle = TextStyle(
    fontFamily: AppFonts.urbanistBold,
    fontSize: 28,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
  );
  static TextStyle welcomeHeadingStyle = TextStyle(
    fontFamily: AppFonts.urbanistBlack,
    fontSize: 42,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w900,
    color: AppColors.whiteColor,
  );
  static TextStyle buttonText = TextStyle(
    fontFamily: AppFonts.urbanistBold,
    fontSize: 16,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
  );
  static TextStyle termsConditionTextStyle = TextStyle(
    fontFamily: AppFonts.urbanistMedium,
    fontSize: 15,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );

  //PHONE NUMBER SCREEN

  static TextStyle numberScreenHeadingStyle = TextStyle(
    fontFamily: AppFonts.urbanistBold,
    fontSize: 36,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w700,
    color: AppColors.darkGreyColor,
  );
  static TextStyle discripStyle = TextStyle(
    fontFamily: AppFonts.urbanistRegular,
    fontSize: 15,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w700,
    color: AppColors.darkGreyColor,
  );
  static TextStyle resendButtonTextStyle = TextStyle(
    fontFamily: AppFonts.urbanistBlack,
    fontSize: 15,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w700,
    color: AppColors.darkGreyColor,
  );
  static TextStyle hintTextStyle = TextStyle(
    fontFamily: AppFonts.urbanistMedium,
    fontSize: 15,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w600,
    color: Colors.grey,
  );
  static TextStyle appBarTitleStyle = TextStyle(
    fontFamily: AppFonts.urbanistSamiBold,
    fontSize: 24,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGreyColor,
  );
  static TextStyle groupNameTitleStyle = TextStyle(
    fontFamily: AppFonts.urbanistSamiBold,
    fontSize: 16,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGreyColor,
  );
  static TextStyle groupNameDisStyle = TextStyle(
    fontFamily: AppFonts.urbanistSamiBold,
    fontSize: 13,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w600,
    color: Color(0xff9E9E9E),
  );
  static TextStyle phoneNumberTextStyle = TextStyle(
    fontFamily: AppFonts.urbanistMedium,
    fontSize: 14,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGreyColor,
  );
  static TextStyle disableFieldStyle = TextStyle(
    fontFamily: AppFonts.urbanistMedium,
    fontSize: 15,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGreyColor,
  );
  static TextStyle groupDetailSubStyle = TextStyle(
    fontFamily: AppFonts.urbanistItalic,
    fontSize: 14,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
  );
}
