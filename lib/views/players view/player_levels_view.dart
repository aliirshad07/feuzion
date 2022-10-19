import 'package:feuzion/core/routes/app_pages.dart';
import 'package:feuzion/core/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/colors.dart';
import '../../core/widgets/custom_app_bar.dart';

class PlayerLevelView extends StatefulWidget {
  const PlayerLevelView({Key? key}) : super(key: key);

  @override
  State<PlayerLevelView> createState() => _PlayerLevelViewState();
}

class _PlayerLevelViewState extends State<PlayerLevelView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xffFF6060),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {}),
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: "Players",
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              MyText(
                text: "This Week",
                size: 20.sp,
                weight: FontWeight.w500,
                color: kWhiteColor,
              ),
              SizedBox(
                height: 12.h,
              ),
              InkWell(
                  onTap: () {
                    Get.toNamed(Routes.PLAYERVIEWPROFILE);
                  },
                  child: _PlayerLevelContainer(
                    textcolor: Color(0xffFF6060),
                    color: AlwaysStoppedAnimation<Color>(
                      Color(0xffFF6060),
                    ),
                  )),
              SizedBox(
                height: 20.h,
              ),
              _PlayerLevelContainer(
                textrank: "#2",
                textcolor: Color(0xff6CDE93),
                color: AlwaysStoppedAnimation<Color>(
                  Color(0xff6CDE93),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              _PlayerLevelContainer(
                textcolor: Color(0xffFF6060),
                color: AlwaysStoppedAnimation<Color>(
                  Color(0xffFF6060),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              _PlayerLevelContainer(
                textcolor: Color(0xffFF6060),
                color: AlwaysStoppedAnimation<Color>(
                  Color(0xffFF6060),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              _PlayerLevelContainer(
                textcolor: Color(0xffFF6060),
                color: AlwaysStoppedAnimation<Color>(
                  Color(0xffFF6060),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlayerLevelContainer extends StatelessWidget {
  final textrank;
  final color;
  final textcolor;
  const _PlayerLevelContainer({
    Key? key,
    this.color,
    this.textrank = '#1',
    this.textcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 92.h,
      width: 383.w,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 35.h,
                backgroundImage: AssetImage("assets/icons/player_level_dp.png"),
              ),
              SizedBox(
                width: 11.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: "Player 1",
                    size: 20.sp,
                    weight: FontWeight.w500,
                    color: kBlackColor,
                    fontFamily: 'Roboto',
                  ),
                  MyText(
                    text: "Level 5",
                    size: 11.sp,
                    weight: FontWeight.w500,
                    color: Colors.grey,
                    fontFamily: 'Roboto',
                  ),
                  SizedBox(
                    width: 213.w,
                    child: LinearProgressIndicator(
                      valueColor: color,
                      backgroundColor: Color(0xffFF6060).withOpacity(0.2),
                      value: 0.5,
                      minHeight: 10.h,
                    ),
                  )
                ],
              ),
            ],
          ),
          MyText(
            color: textcolor,
            text: "$textrank",
            size: 20.sp,
            weight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}
