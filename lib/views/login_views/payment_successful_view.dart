import 'package:feuzion/controllers/payment_successfull_controller.dart';
import 'package:feuzion/core/routes/app_pages.dart';
import 'package:feuzion/core/widgets/my_text.dart';
import 'package:feuzion/views/login_views/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/colors.dart';

class PaymentSuccessfulView extends GetView<PaymentSuccessfulController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/white_tick_icon.svg"),
              SizedBox(
                height: 38.h,
              ),
              MyText(
                text: "Payment Successful",
                size: 24.sp,
                weight: FontWeight.w500,
                color: kWhiteColor,
                fontFamily: 'Roboto',
              ),
              SizedBox(
                height: 75.h,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => LoginView());
                },
                child: _ContinueButtonPaymentSuccessful(
                  text: 'Continue',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ContinueButtonPaymentSuccessful extends StatelessWidget {
  final text;

  const _ContinueButtonPaymentSuccessful({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      width: 374.w,
      color: Color(0xff04497A),
      child: Center(
        child: MyText(
          fontFamily: 'Roboto',
          text: "$text",
          color: kWhiteColor,
          weight: FontWeight.w500,
          size: 24.sp,
        ),
      ),
    );
  }
}
