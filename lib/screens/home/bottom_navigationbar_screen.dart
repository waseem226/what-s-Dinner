import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whats_for_dinner/screens/home/group_detail.dart';
import 'package:whats_for_dinner/screens/home/history_screen.dart';
import 'package:whats_for_dinner/utils/colors.dart';

import 'favourite_screen.dart';
import 'message_Screen.dart';
import 'swipe_group_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  List<Widget> _bottomList = <Widget>[
    GroupDetailScreen(),
    MessageScreen(),
    SwipeGroupScreen(),
    FavouriteScreen(),
    HistoryScreen(),
  ];
  var _curruntIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            elevation: 5,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: AppColors.darkGreyColor,
            selectedItemColor: AppColors.darkPinkColor,
            backgroundColor: AppColors.whiteColor,
            selectedIconTheme: IconThemeData(color: AppColors.darkPinkColor),
            unselectedIconTheme: IconThemeData(color: AppColors.darkGreyColor),
            currentIndex: _curruntIndex,
            onTap: _onItemTapped,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/images/home.svg"),
                  activeIcon: SvgPicture.asset(
                    "assets/images/home.svg",
                    color: AppColors.darkPinkColor,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/images/chat.svg"),
                  activeIcon: SvgPicture.asset(
                    "assets/images/chat.svg",
                    color: AppColors.darkPinkColor,
                  ),
                  label: "Message"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/images/swipe.svg"),
                  activeIcon: SvgPicture.asset(
                    "assets/images/swipe.svg",
                    color: AppColors.darkPinkColor,
                  ),
                  label: "Fave"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/images/fave.svg"),
                  activeIcon: SvgPicture.asset(
                    "assets/images/fave.svg",
                    color: AppColors.darkPinkColor,
                  ),
                  label: "Faveret"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/images/setting.svg"),
                  activeIcon: SvgPicture.asset(
                    "assets/images/setting.svg",
                    color: AppColors.darkPinkColor,
                  ),
                  label: "Setting"),
            ]),
        body: Center(child: _bottomList.elementAt(_curruntIndex)));
  }

  void _onItemTapped(int index) {
    setState(() {
      _curruntIndex = index;
    });
  }
}
