import 'package:feuzion/core/colors.dart';
import 'package:feuzion/core/math_utils.dart';
import 'package:feuzion/core/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../controllers/payment_controller.dart';
import '../../core/widgets/my_text.dart';

class PaymentOptionView extends GetView<PaymentController> {
  const PaymentOptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 145.h,
            ),
            Container(
              padding: EdgeInsets.all(9),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyText(
                    text: 'Payable Amount',
                    color: kSecondaryColor,
                    size: 12,
                    weight: FontWeight.w400,
                    fontFamily: 'Roboto',
                  ),
                  MyText(
                    text: '£19',
                    color: kSecondaryColor,
                    size: 48,
                    weight: FontWeight.w700,
                    fontFamily: 'Roboto',
                  ),
                  MyText(
                    text: 'Basic Plan',
                    color: kSecondaryColor,
                    size: 20,
                    weight: FontWeight.w400,
                    fontFamily: 'Roboto',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: MyText(
                text: 'Choose your payment method',
                color: kWhiteColor,
                size: 24,
                weight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.PAYMENTVIEW);
              },
              child: Container(
                width: double.infinity,
                height: getHorizontalSize(200),
                child: Column(
                  children: [
                    ListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 0),
                      leading: Image.asset(
                        'assets/icons/master.png',
                        width: 58,
                        height: 38,
                      ),
                      title: MyText(
                        text: 'Master Card',
                        color: kWhiteColor,
                        size: 18,
                        weight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: kWhiteColor,
                        size: 30,
                      ),
                    ),
                    const Divider(
                      thickness: 0.8,
                      color: kWhiteColor,
                    ),
                    ListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 0),
                      leading: Image.asset(
                        'assets/icons/visa.png',
                        width: 58,
                        height: 38,
                      ),
                      title: MyText(
                        text: 'VISA',
                        color: kWhiteColor,
                        size: 18,
                        weight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: kWhiteColor,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Divider(
                      color: kWhiteColor,
                    ),
                    ListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 0),
                      leading: Image.asset(
                        'assets/icons/visa.png',
                        width: 58,
                        height: 38,
                      ),
                      title: MyText(
                        text: 'VISA',
                        color: kWhiteColor,
                        size: 18,
                        weight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: kWhiteColor,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Divider(
                      color: kWhiteColor,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: getHorizontalSize(130),
            ),
          ],
        ),
      ),
    );
  }
}
