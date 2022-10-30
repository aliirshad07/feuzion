import 'package:feuzion/controllers/player_performance_controller.dart';
import 'package:feuzion/core/widgets/custom_app_bar.dart';
import 'package:feuzion/core/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../core/colors.dart';
import 'package:feuzion/core/routes/app_pages.dart';
import 'package:feuzion/views/players view/player_performance_edit_view.dart';

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

class PlayerPerformanceView extends GetView<PlayerPerformanceController> {
  PlayerPerformanceController _controller = Get.put(PlayerPerformanceController());

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
              height: 25,
            ),
            MyText(
              text: "This Week",
              size: 20,
              weight: FontWeight.w500,
              color: kWhiteColor,
              fontFamily: 'Roboto',
            ),
            SizedBox(
              height: 81,
            ),
            _ReuseContainerPerformance(
              svgAssetPerformance: icon[0],
              middleText: text[0],
              percentText: _controller.initialKickPower,
            ),
            _ReuseContainerPerformance(
              svgAssetPerformance: icon[1],
              middleText: text[1],
              percentText: _controller.initialGames,
            ),
            _ReuseContainerPerformance(
              svgAssetPerformance: icon[2],
              middleText: text[2],
              percentText: _controller.initialFouls,
            ),
            _ReuseContainerPerformance(
              svgAssetPerformance: icon[3],
              middleText: text[3],
              percentText: _controller.initialMinutesPlayed,
            ),
            _ReuseContainerPerformance(
              svgAssetPerformance: icon[4],
              middleText: text[4],
              percentText: _controller.initialShortOnTarget,
            ),
            _ReuseContainerPerformance(
              svgAssetPerformance: icon[5],
              middleText: text[5],
              percentText: _controller.initialSaves,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Get.to(PlayerPerformanceEditView());
                  },
                  child: Icon(Icons.edit),
                ),
              ),
            )
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
    return Obx(() => Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      height: 60,
      width: 374,
      color: Color(0xffF4F5FA),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset("$svgAssetPerformance"),
              SizedBox(
                width: 10,
              ),
              MyText(
                text: "$middleText",
                size: 20,
                weight: FontWeight.w500,
                color: Color(0xff323F4B),
                fontFamily: 'Roboto',
              ),
            ],
          ),
          MyText(
            text: "$percentText",
            size: 18,
            weight: FontWeight.w400,
            color: Color(0xff323F4B),
            fontFamily: 'Roboto',
          )
        ],
      ),
    ));
  }
}
