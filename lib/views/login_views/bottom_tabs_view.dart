import 'dart:ui';

import 'package:feuzion/views/login_views/diet_plan_view.dart';
import 'package:feuzion/views/login_views/home_view.dart';
import 'package:feuzion/views/login_views/payment_successful_view.dart';
import 'package:feuzion/views/login_views/payment_view.dart';
import 'package:feuzion/views/players%20view/player_profile_view.dart';
import 'package:feuzion/views/players%20view/players_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/bottom_tabs_controller.dart';

class BottomTabsView extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
                // Container(child: SvgPicture.asset("assets/icons/home.svg")),
                label: 'Home',
                backgroundColor: Color(0xff3A444D),
                activeIcon: Icon(
                  Icons.home_outlined,
                  color: Colors.redAccent,
                ),
              ),
              BottomNavigationBarItem(
                  icon: Container(
                      child: SvgPicture.asset("assets/icons/players.svg")),
                  label: 'Players',
                  backgroundColor: Color(0xff3A444D),
                  activeIcon: SvgPicture.asset(
                    "assets/icons/players.svg",
                    color: Colors.redAccent,
                  )),
              BottomNavigationBarItem(
                  icon: Container(
                      child: SvgPicture.asset("assets/icons/diet.svg")),
                  label: 'Diet Plan',
                  backgroundColor: Color(0xff3A444D),
                  activeIcon: SvgPicture.asset(
                    "assets/icons/diet.svg",
                    color: Colors.redAccent,
                  )),
              BottomNavigationBarItem(
                icon: Container(
                    child: SvgPicture.asset("assets/icons/profile.svg")),
                label: 'Profile',
                backgroundColor: Color(0xff3A444D),
                activeIcon: SvgPicture.asset(
                  "assets/icons/profile.svg",
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final BottomTabsController landingPageController =
        Get.put(BottomTabsController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [
              HomeView(),
              PlayersView(),
              DietPlanView(),
              PlayerProfileView(),
            ],
          )),
    ));
  }
}
