import 'package:feuzion/core/routes/app_pages.dart';
import 'package:feuzion/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/colors.dart';
import '../../core/widgets/my_text.dart';
import 'package:feuzion/controllers/player_over_all_performance_controller.dart';

class PlayerOverAllPerformanceView extends GetView<PlayerOverAlllPerformanceController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: "T.A.P.E.S",
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              MyText(
                text: "This Week",
                size: 20,
                weight: FontWeight.w500,
                color: kWhiteColor,
              ),
              SizedBox(
                height: 32,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.PLAYERTECHNINCAL);
                },
                child: _PlayerLevelContainer(
                  titleText: 'Technical',
                  bgcolor: Color(0xffFF6060).withOpacity(0.2),
                  color: AlwaysStoppedAnimation<Color>(
                    Color(0xffFF6060),
                  ),
                  percentText: '${controller.initialTechnical.value}',
                  percentTextcolor: Color(0xffFF6060),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.PLAYERAESTHETIC);
                },
                child: _PlayerLevelContainer(
                  titleText: 'Athletic',
                  bgcolor: Color(0xff4CAF50).withOpacity(0.2),
                  color: AlwaysStoppedAnimation<Color>(
                    Color(0xff4CAF50),
                  ),
                  percentText: '${controller.initialAthletic.value}',
                  percentTextcolor: Color(0xff4CAF50),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.PLAYERPYSCHOLOGY);
                },
                child: _PlayerLevelContainer(
                  titleText: 'Psychology',
                  bgcolor: Color(0xff4CAF50).withOpacity(0.2),
                  color: AlwaysStoppedAnimation<Color>(
                    Color(0xff4CAF50),
                  ),
                  percentText: '${controller.initialPsychology.value}',
                  percentTextcolor: Color(0xff4CAF50),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.PLAYEREDUCATION);
                },
                child: _PlayerLevelContainer(
                  titleText: 'Education',
                  bgcolor: Color(0xff3DA9FC).withOpacity(0.2),
                  color: AlwaysStoppedAnimation<Color>(
                    Color(0xff3DA9FC),
                  ),
                  percentText: '${controller.initialEducation.value}',
                  percentTextcolor: Color(0xff3DA9FC),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.PLAYERSOCIAL);
                },
                child: _PlayerLevelContainer(
                  titleText: 'Social',
                  bgcolor: Color(0xff389298).withOpacity(0.2),
                  color: AlwaysStoppedAnimation<Color>(
                    Color(0xff389298),
                  ),
                  percentText: '${controller.initialSocial.value}',
                  percentTextcolor: Color(0xff389298),
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
  final String titleText;
  final String percentText;
  final color;
  final bgcolor;
  final percentTextcolor;
  const _PlayerLevelContainer({
    Key? key,
    required this.titleText,
    this.color,
    this.bgcolor,
    required this.percentText,
    this.percentTextcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 92,
      width: 383,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: "$titleText",
                    size: 20,
                    weight: FontWeight.w500,
                    color: kBlackColor,
                    fontFamily: 'Roboto',
                  ),
                  MyText(
                    text: "Touch, Intelligence",
                    size: 11,
                    weight: FontWeight.w500,
                    color: Colors.grey,
                    fontFamily: 'Roboto',
                  ),
                  SizedBox(
                    width: 213,
                    child: LinearProgressIndicator(
                      valueColor: color,
                      backgroundColor: bgcolor,
                      value: 0.5,
                      minHeight: 10,
                    ),
                  )
                ],
              ),
            ],
          ),
          MyText(
            color: percentTextcolor,
            text: "$percentText",
            size: 20,
            weight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}
