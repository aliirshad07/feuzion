import '../../core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/colors.dart';

class PlayersTab extends StatefulWidget {
  final String uid;
  const PlayersTab({super.key, required this.uid});

  @override
  State<PlayersTab> createState() => _PlayersTabState();
}

class _PlayersTabState extends State<PlayersTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffFF6060),
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            Get.toNamed("/add_player", parameters: {"uid": widget.uid});
          },
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title: Text("Players", style: fontRoboto(fontSize: 24, fontWeight: FontWeight.w500, color: kBlackColor)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 150.0),
                child: Text(
                  "No players to show. Add some players",
                  style: fontRoboto(fontSize: 14, fontWeight: FontWeight.w500, color: kWhiteColor.withOpacity(0.6)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
