import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../controllers/player_technical_controller.dart';
import '../../core/colors.dart';
import '../../core/routes/app_pages.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/my_text.dart';

class PlayerTechnicalViewTwo extends GetView<PlayerTechnicalController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
        appBar: CustomAppBar(
          title: "T.A.P.E.S",
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Center(
              child: MyText(
                text: "This Week",
                size: 20,
                weight: FontWeight.w500,
                color: kWhiteColor,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              height: 530,
              width: 383,
              color: Color(0xffF4F5FA),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () => Get.toNamed(Routes.TECHNINCALFORM),
                      child: MyText(
                        text: "Edit",
                        size: 14,
                        weight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.5),
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(
                        text: "Technical",
                        size: 20,
                        weight: FontWeight.w500,
                        color: Colors.black,
                        fontFamily: 'Roboto',
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      CircularPercentIndicator(
                        backgroundColor: Color(0xffF1F1F1),
                        radius: 40.0,
                        lineWidth: 5.0,
                        animation: true,
                        percent: 0.6,
                        center: new Text(
                          "67%",
                          style: new TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        progressColor: Color(0xffFF6060),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 31,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: "Touch",
                                  size: 20,
                                  weight: FontWeight.w500,
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  width: 213,
                                  child: LinearProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xffFF6060)),
                                    backgroundColor:
                                        Color(0xffFF6060).withOpacity(0.2),
                                    value: 0.5,
                                    minHeight: 10,
                                  ),
                                ),
                              ],
                            ),
                            MyText(
                              text: "${controller.initialTouch.value}",
                              size: 24,
                              weight: FontWeight.w400,
                              color: Colors.black,
                              fontFamily: 'Roboto',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 33,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: "Intelligence",
                                  size: 20,
                                  weight: FontWeight.w500,
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  width: 213,
                                  child: LinearProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xffFF6060)),
                                    backgroundColor:
                                        Color(0xffFF6060).withOpacity(0.2),
                                    value: 0.5,
                                    minHeight: 10,
                                  ),
                                ),
                              ],
                            ),
                            MyText(
                              text: "${controller.initialIntelligence.value}",
                              size: 24,
                              weight: FontWeight.w400,
                              color: Colors.black,
                              fontFamily: 'Roboto',
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
