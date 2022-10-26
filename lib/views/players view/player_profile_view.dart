import 'package:feuzion/controllers/player_profile_controller.dart';
import 'package:feuzion/core/routes/app_pages.dart';
import 'package:feuzion/core/widgets/custom_app_bar.dart';
import 'package:feuzion/core/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../core/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlayerProfileView extends GetView<PlayerViewProfileController> {
  const PlayerProfileView({super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Player 1",
        ),
        backgroundColor: Colors.transparent,
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('players').snapshots(),
          builder: (context, AsyncSnapshot snapshot){
            if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()),);
            }
            return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 23,
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage:
                          AssetImage("assets/icons/player_level_dp.png"),
                        ),
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 13),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                        decoration: BoxDecoration(
                            color: Color(0xff04497A),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(2, 3))
                            ]),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  text: "Player ${snapshot.data!.docs["playerNumber"]}",
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
                                  text: snapshot.data!.docs["age"],
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
                                  text: snapshot.data!.docs["height"],
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
                                  text: snapshot.data!.docs["weight"],
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
                                  text: snapshot.data!.docs["position"],
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
                      SizedBox(
                        height: 27,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: "Dashboard",
                              size: 24,
                              color: kWhiteColor,
                              weight: FontWeight.w700,
                              fontFamily: 'Poppins',
                            ),
                            SizedBox(
                              height: 29,
                            ),
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
                            SizedBox(
                              height: 20,
                            ),
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
                      )
                    ],
                  ),
                );

          },
        )
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
        width: 177,
        decoration: BoxDecoration(
            color: Color(0xff04497A),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2, 3))
            ]),
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
            Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset("assets/icons/forwardArrow.svg"))
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
      padding: EdgeInsets.only(top: 10, right: 10, left: 10),
      height: 138,
      width: 177,
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
        style: new TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.white,
            fontFamily: 'Roboto'),
      ),
      progressColor: kcolor,
    );
  }
}
