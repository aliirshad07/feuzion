import 'package:feuzion/core/routes/app_pages.dart';
import 'package:feuzion/core/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/colors.dart';
import '../../core/widgets/custom_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlayerLevelView extends StatefulWidget {
  const PlayerLevelView({Key? key}) : super(key: key);

  @override
  State<PlayerLevelView> createState() => _PlayerLevelViewState();
}

class _PlayerLevelViewState extends State<PlayerLevelView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xffFF6060),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {}),
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: "Players",
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('players').snapshots(),
            builder: (context,AsyncSnapshot snapshot){
              if(snapshot.hasError){
                return Center(child: Text(snapshot.error.toString()),);
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: _PlayerLevelContainer(
                      textrank: snapshot.data!.docs[index]["playerNumber"],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _PlayerLevelContainer extends StatelessWidget {
  final textrank;
  final color;
  final textcolor;
  const _PlayerLevelContainer({
    this.color,
    this.textrank = '#1',
    this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Get.toNamed(Routes.PLAYERVIEWPROFILE),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 92,
        width: 383,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage("assets/icons/player_level_dp.png"),
                ),
                SizedBox(
                  width: 11,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: 'Player $textrank',
                      size: 20,
                      weight: FontWeight.w500,
                      color: kBlackColor,
                      fontFamily: 'Roboto',
                    ),
                    MyText(
                      text: "Level 5",
                      size: 11,
                      weight: FontWeight.w500,
                      color: Colors.grey,
                      fontFamily: 'Roboto',
                    ),
                    SizedBox(
                      width: 213,
                      child: LinearProgressIndicator(
                        valueColor: color,
                        backgroundColor: Color(0xffFF6060).withOpacity(0.2),
                        value: 0.5,
                        minHeight: 10,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ],
            ),
            MyText(
              color: textcolor,
              text: "$textrank",
              size: 20,
              weight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}
