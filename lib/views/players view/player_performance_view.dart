import 'package:feuzion/core/widgets/custom_app_bar.dart';
import 'package:feuzion/core/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/colors.dart';

final List icon = [
  'assets/icons/kickPower.svg',
  'assets/icons/games.svg',
  'assets/icons/fouls.svg',
  'assets/icons/minutesPlayed.svg',
  'assets/icons/shotOnTarget.svg',
  'assets/icons/saves.svg'
];
final List text = [
  'Kick Power',
  'Games',
  'Fouls',
  'Minutes Played',
  'Shot on Target',
  'Saves'
];
final List percent = [
  '82',
  '10',
  '10',
  '120',
  '05',
  '03',
];

class PlayerPerformanceView extends StatefulWidget {
  const PlayerPerformanceView({Key? key}) : super(key: key);

  @override
  State<PlayerPerformanceView> createState() => _PlayerPerformanceViewState();
}

class _PlayerPerformanceViewState extends State<PlayerPerformanceView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: 'Performance',
        ),
        body: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            MyText(
              text: "This Week",
              size: 20.sp,
              weight: FontWeight.w500,
              color: kWhiteColor,
              fontFamily: 'Roboto',
            ),
            SizedBox(
              height: 81.h,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: icon.length,
                itemBuilder: (context, indexx) {
                  return _ReuseContainerPerformance(
                      svgAssetPerformance: icon[indexx],
                      middleText: text[indexx],
                      percentText: percent[indexx]);
                })
          ],
        ),
      ),
    );
  }
}

class _ReuseContainerPerformance extends StatelessWidget {
  final svgAssetPerformance;
  final middleText;
  final percentText;
  const _ReuseContainerPerformance({
    Key? key,
    required this.svgAssetPerformance,
    required this.middleText,
    required this.percentText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      height: 60.h,
      width: 374.w,
      color: Color(0xffF4F5FA),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset("$svgAssetPerformance"),
              SizedBox(
                width: 10.w,
              ),
              MyText(
                text: "$middleText",
                size: 20.sp,
                weight: FontWeight.w500,
                color: Color(0xff323F4B),
                fontFamily: 'Roboto',
              ),
            ],
          ),
          MyText(
            text: "$percentText",
            size: 18.sp,
            weight: FontWeight.w400,
            color: Color(0xff323F4B),
            fontFamily: 'Roboto',
          )
        ],
      ),
    );
  }
}
