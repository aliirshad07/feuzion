import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feuzion/core/collections.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    FirebaseAuth auth = FirebaseAuth.instance;

    String uid = auth.currentUser == null ? "" : auth.currentUser!.uid;

    await Future.delayed(const Duration(seconds: 1), () async {
      if (uid.isEmpty) {
        Get.offAllNamed("/login");
        return;
      }

      DocumentSnapshot documentSnapshot = await usersCollection.doc(uid).get();

      if (!documentSnapshot["accountCompleted"]) {
        Get.offAllNamed("/complete_account", parameters: {"uid": uid});
        return;
      }

      Get.offAllNamed("/root", parameters: {"uid": uid});
    });
  }
}
