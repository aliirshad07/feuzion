import 'package:feuzion/controllers/player_view_controller.dart';
import 'package:feuzion/core/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/colors.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/my_text.dart';

class PlayersView extends GetView<PlayerViewController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffFF6060),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Get.toNamed(Routes.ADDPLAYER);
          },
        ),
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: "Players",
        ),
        body: Column(
          children: [
            SizedBox(
              height: 102.h,
            ),
            Center(
              child: MyText(
                text: "No players to show. Add some players",
                size: 14.sp,
                weight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
