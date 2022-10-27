import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feuzion/core/collections.dart';
import 'package:get/get.dart';

class PlayerDetailsController extends GetxController {
  String? uid = Get.parameters["uid"], playerID = Get.parameters["playerID"];
  RxMap playerDetails = {}.obs;
  @override
  void onInit() async {
    playerDetails.bindStream(getPlayer());
    super.onInit();
  }

  getPlayer() {
    Stream<DocumentSnapshot> data = usersCollection.doc(uid).collection("players").doc(playerID).snapshots();

    return data.map((event) => {
          "firstName": event["firstName"],
          "lastName": event["lastName"],
          "age": event["age"],
          "height": event["height"],
          "weight": event["weight"],
          "position": event["position"],
          "picture": event["picture"],
        });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
