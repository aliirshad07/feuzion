import 'package:feuzion/views/tabs/home_tab.dart';
import 'package:feuzion/views/tabs/players_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  String? uid = Get.parameters["uid"];

  var tabIndex = 0.obs;
  List tabWidgets = [];

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    tabWidgets = [
      HomeTab(uid: uid!),
      PlayersTab(uid: uid!),
      Container(),
      Container(),
      // HomeTab(),
      // PlayersTab(),
      // DietPlanTab),
      // ProfileTab(),
    ];
    super.onInit();
  }

}
