import 'package:feuzion/controllers/player_performance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:feuzion/core/colors.dart';
import 'package:feuzion/core/widgets/custom_app_bar.dart';
import 'package:feuzion/core/widgets/my_text.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:feuzion/core/constants.dart';
import 'package:feuzion/core/widgets/edit_card.dart';

class PlayerPerformanceEditView extends GetView<PlayerPerformanceController>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: 'Performance',
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 60,),
              Obx(() => editCard(
                title: 'Kick power',
                initialValue: controller.initialKickPower.value,
                onChanged: (val){
                  controller.initialKickPower.value = val.toInt();
                  },
                ),
              ),
              Obx(() => editCard(
                title: 'Games',
                initialValue: controller.initialGames.value,
                onChanged: (val){
                  controller.initialGames.value = val.toInt();
                  },
                ),
              ),
              Obx(() => editCard(
                title: 'Fouls',
                initialValue: controller.initialFouls.value,
                onChanged: (val){
                  controller.initialFouls.value = val.toInt();
                  },
                ),
              ),
              Obx(() => editCard(
                title: 'Minutes Played',
                initialValue: controller.initialMinutesPlayed.value,
                onChanged: (val){
                  controller.initialMinutesPlayed.value = val.toInt();
                  },
                ),
              ),
              Obx(() => editCard(
                title: 'Shot on Target',
                initialValue: controller.initialShortOnTarget.value,
                onChanged: (val){
                  controller.initialShortOnTarget.value = val.toInt();
                  },
                ),
              ),
              Obx(() => editCard(
                title: 'Saves',
                initialValue: controller.initialSaves.value,
                onChanged: (val){
                  controller.initialSaves.value = val.toInt();
                  },
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                    foregroundColor: kWhiteColor,
                    elevation: 0,
                    backgroundColor: kSecondaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 155)),
                child: Text("Save", style: fontRoboto(fontSize: 20, fontWeight: FontWeight.w500)),
              ),



            ],
          ),
        )
      ),
    );
  }
}
