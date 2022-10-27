import 'package:cached_network_image/cached_network_image.dart';
import 'package:feuzion/controllers/player_profile_controller.dart';
import 'package:feuzion/core/routes/app_pages.dart';
import 'package:feuzion/core/widgets/custom_app_bar.dart';
import 'package:feuzion/core/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../core/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/constants.dart';

class PlayerDetails extends GetView<PlayerDetailsController> {
  const PlayerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Obx(
        () => controller.playerDetails.isEmpty
            ? const SizedBox()
            : Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: kWhiteColor,
                  iconTheme: const IconThemeData(color: kBlackColor),
                  title: Text("${controller.playerDetails["firstName"]} ${controller.playerDetails["lastName"]}",
                      style: fontRoboto(fontSize: 24, fontWeight: FontWeight.w500, color: kBlackColor)),
                ),
                backgroundColor: Colors.transparent,
                body: ListView(
                  padding: const EdgeInsets.all(22),
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: controller.playerDetails["picture"],
                          placeholder: (c, s) => const ColoredBox(color: kLightGreyColor),
                          width: 120,
                          fit: BoxFit.cover,
                          height: 120,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                      decoration: BoxDecoration(
                          color: Color(0xff04497A),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), spreadRadius: 2, blurRadius: 2, offset: Offset(2, 3))]),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: "${controller.playerDetails["firstName"]} ${controller.playerDetails["lastName"]}",
                                size: 30,
                                weight: FontWeight.w700,
                                color: kWhiteColor,
                                fontFamily: 'Roboto',
                              ),
                              SvgPicture.asset(
                                "assets/icons/pencil_icon_white.svg",
                                height: 24,
                                width: 24,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              MyText(
                                text: "Age:",
                                color: Colors.white.withOpacity(0.5),
                                size: 14,
                                weight: FontWeight.w500,
                                fontFamily: 'Roboto',
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              MyText(
                                text: controller.playerDetails["age"].toString(),
                                color: Colors.white,
                                size: 14,
                                weight: FontWeight.w500,
                                fontFamily: 'Roboto',
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              MyText(
                                text: "Height:",
                                color: Colors.white.withOpacity(0.5),
                                size: 14,
                                weight: FontWeight.w400,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              MyText(
                                text: controller.playerDetails["height"].toString(),
                                color: Colors.white,
                                size: 14,
                                weight: FontWeight.w500,
                                fontFamily: 'Roboto',
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              MyText(
                                text: "Weight:",
                                color: Colors.white.withOpacity(0.5),
                                size: 14,
                                weight: FontWeight.w400,
                                fontFamily: 'Roboto',
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              MyText(
                                text: controller.playerDetails["weight"],
                                color: Colors.white,
                                size: 14,
                                weight: FontWeight.w500,
                                fontFamily: 'Roboto',
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              MyText(
                                text: "Position:",
                                color: Colors.white.withOpacity(0.5),
                                size: 14,
                                weight: FontWeight.w400,
                                fontFamily: 'Roboto',
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              MyText(
                                text: controller.playerDetails["position"],
                                color: Colors.white,
                                size: 14,
                                weight: FontWeight.w500,
                                fontFamily: 'Roboto',
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    MyText(
                      text: "Dashboard",
                      size: 24,
                      color: kWhiteColor,
                      weight: FontWeight.w700,
                      fontFamily: 'Poppins',
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.PLAYERPERFORMACE);
                          },
                          child: _ReusePlayerProfileConatiner(
                            textTop: 'Performance',
                            giveColor: Color(0xffFF6060),
                            fillpercent: "67%",
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.PLAYEOVERALLRPERFORMACE);
                          },
                          child: _ReusePlayerProfileConatiner(
                            textTop: 'T.A.P.E.S',
                            giveColor: Color(0xff6CDE93),
                            fillpercent: "78%",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        _SvgConatiner(
                          svgAsset: 'assets/icons/apple.svg',
                          bottomText: 'Diet Plan',
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        _SvgConatiner(
                          svgAsset: 'assets/icons/dumble.svg',
                          bottomText: 'Excercise Suggestions',
                        ),
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

class _SvgConatiner extends StatelessWidget {
  final svgAsset;
  final bottomText;
  const _SvgConatiner({
    Key? key,
    required this.svgAsset,
    required this.bottomText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10),
        height: 138,
        width: Get.width / 2 - 29.5,
        decoration: BoxDecoration(
            color: Color(0xff04497A),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), spreadRadius: 2, blurRadius: 2, offset: Offset(2, 3))]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("$svgAsset"),
            MyText(
              text: "$bottomText",
              size: 18,
              weight: FontWeight.w500,
              color: kWhiteColor,
              fontFamily: 'Roboto',
            ),
            Align(alignment: Alignment.bottomRight, child: SvgPicture.asset("assets/icons/forwardArrow.svg"))
          ],
        ));
  }
}

class _ReusePlayerProfileConatiner extends StatelessWidget {
  final fillpercent;
  final giveColor;
  final textTop;
  const _ReusePlayerProfileConatiner({
    Key? key,
    required this.textTop,
    required this.giveColor,
    required this.fillpercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 140,
      width: Get.width / 2 - 29.5,
      decoration: BoxDecoration(
        color: Color(0xff04497A),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(2, 3),
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: MyText(
              text: "$textTop",
              size: 15,
              weight: FontWeight.w500,
              color: kWhiteColor,
              fontFamily: 'Roboto',
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: _ReuseCircleProgressVisit(
              percentage: 0.67,
              fillpercent: "$fillpercent%",
              kcolor: giveColor,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset("assets/icons/forwardArrow.svg"),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}

class _ReuseCircleProgressVisit extends StatelessWidget {
  final fillpercent;
  final percentage;

  final kcolor;

  const _ReuseCircleProgressVisit({
    Key? key,
    required this.percentage,
    required this.fillpercent,
    required this.kcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      backgroundColor: Color(0xffF1F1F1),
      radius: 40,
      lineWidth: 6.0,
      animation: true,
      percent: percentage,
      center: new Text(
        fillpercent,
        style: new TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white, fontFamily: 'Roboto'),
      ),
      progressColor: kcolor,
    );
  }
}
