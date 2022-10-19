import 'package:feuzion/controllers/diet_plan_controller.dart';
import 'package:feuzion/core/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/colors.dart';
import '../../core/widgets/custom_app_bar.dart';

class DietPlanView extends GetView<DietPlanController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: "My Diet Plan",
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              _DownloadContainer(
                plan: 'Starter Plan',
              ),
              SizedBox(
                height: 20.h,
              ),
              _DownloadContainer(
                plan: 'Intermedicate Plan',
              ),
              SizedBox(
                height: 20.h,
              ),
              _DownloadContainer(
                plan: 'Premium Plan',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DownloadContainer extends StatelessWidget {
  final plan;
  const _DownloadContainer({
    Key? key,
    required this.plan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: "$plan",
          color: kWhiteColor,
          size: 16.sp,
          fontFamily: "Roboto",
          weight: FontWeight.w500,
        ),
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 60.h,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: "Download",
                  color: kBlackColor,
                  size: 14.sp,
                  fontFamily: "Roboto",
                  weight: FontWeight.w400,
                ),
                Icon(
                  Icons.download,
                  color: Colors.black,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
