import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/collections.dart';
import '../core/constants.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController(), emailController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  loginUser() async {
    if (!formKey.currentState!.validate()) return;

    try {
      await _auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) async {
        String uid = value.user!.uid;

        DocumentSnapshot documentSnapshot = await usersCollection.doc(uid).get();

        if (!documentSnapshot["accountCompleted"]) {
          Get.offAllNamed("/complete_account", parameters: {"uid": uid});
        }

        Get.offAllNamed("/root", parameters: {"uid": uid});
      });
    } on FirebaseAuthException catch (err) {
      switch (err.code) {
        case "user-not-found":
          customToast("Account not found");
          break;
        case "wrong-password":
          customToast("Wrong password");
          break;
        case "invalid-email":
          customToast("Invalid email format");
          break;
      }
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
