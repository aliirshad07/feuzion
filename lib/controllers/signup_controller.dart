import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/collections.dart';
import '../core/constants.dart';

class SignupController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController(),
      lastNameController = TextEditingController(),
      passwordController = TextEditingController(),
      emailController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  createUser() async {
    try {
      await _auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) async {
        var user = value.user!;

        user.sendEmailVerification();

        await usersCollection.doc(user.uid).set({
          "firstName": firstNameController.text.trim(),
          "lastName": lastNameController.text.trim(),
          "email": emailController.text.trim().toLowerCase(),
          "username": "",
          "dob": "",
          "gender": "",
          "accountCompleted": false,
          "joined": DateTime.now(),
          "lastLogin": null,
          "profilePicture": "",
        });
        Get.offAllNamed("/complete_account", parameters: {"uid": user.uid});
      });
    } on FirebaseAuthException catch (err) {
      switch (err.code) {
        case "email-already-in-use":
          customToast("Email already in use");
          break;
        case "weak-password":
          customToast("Weak password");
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
    lastNameController.dispose();
    firstNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
