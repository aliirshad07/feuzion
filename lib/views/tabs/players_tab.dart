import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feuzion/core/collections.dart';

import '../../core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/colors.dart';
import '../../core/widgets/my_text.dart';

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
        body: StreamBuilder<QuerySnapshot>(
          stream: usersCollection.doc(widget.uid).collection("players").orderBy("level", descending: true).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            List<DocumentSnapshot> players = snapshot.data!.docs;
            if (snapshot.hasData && players.isEmpty) {
              return Center(
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
              );
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: players.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: PlayerLevelContainer(uid: widget.uid, player: players[index], index: index + 1),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class PlayerLevelContainer extends StatelessWidget {
  final String uid;
  final DocumentSnapshot player;
  final int index;
  const PlayerLevelContainer({super.key, required this.player, required this.index, required this.uid});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed("/player_details", parameters: {"uid": uid, "playerID": player.id}),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 95,
        color: Colors.white,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl: player["picture"],
                placeholder: (c, s) => const ColoredBox(color: kLightGreyColor),
                width: 70,
                fit: BoxFit.cover,
                height: 70,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${player["firstName"]} ${player["lastName"]}",
                    style: fontRoboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: kBlackColor,
                    ),
                  ),
                  Text(
                    "Level ${player["level"] ~/ 100}",
                    style: fontRoboto(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  LinearProgressIndicator(
                    valueColor: const AlwaysStoppedAnimation(Colors.red),
                    backgroundColor: Colors.red.shade100,
                    value: 0,
                    minHeight: 10,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Text(
              "#${index}",
              style: fontRoboto(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
