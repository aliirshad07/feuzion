import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/root_controller.dart';

class Root extends GetView<RootController> {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex.value,
          backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
          unselectedItemColor: Colors.white.withOpacity(0.5),
          selectedItemColor: Colors.white,
          unselectedLabelStyle: TextStyle(color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.w500, fontSize: 12),
          selectedLabelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
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
                icon: Container(child: SvgPicture.asset("assets/icons/players.svg")),
                label: 'Players',
                backgroundColor: Color(0xff3A444D),
                activeIcon: SvgPicture.asset(
                  "assets/icons/players.svg",
                  color: Colors.redAccent,
                )),
            BottomNavigationBarItem(
                icon: Container(child: SvgPicture.asset("assets/icons/diet.svg")),
                label: 'Diet Plan',
                backgroundColor: Color(0xff3A444D),
                activeIcon: SvgPicture.asset(
                  "assets/icons/diet.svg",
                  color: Colors.redAccent,
                )),
            BottomNavigationBarItem(
              icon: Container(child: SvgPicture.asset("assets/icons/profile.svg")),
              label: 'Profile',
              backgroundColor: Color(0xff3A444D),
              activeIcon: SvgPicture.asset(
                "assets/icons/profile.svg",
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
      body: Obx(() => controller.tabWidgets[controller.tabIndex.value]),
    );
  }
}
