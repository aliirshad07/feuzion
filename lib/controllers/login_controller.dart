import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement HomeController
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void checkLogin() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
  }

  Future<String> logInUser({
    required String email,
    required String password,
  }) async{
    String res = 'An error occurred';

    try{
      if(email.isNotEmpty || password.isNotEmpty){
        // register users
        await _auth.signInWithEmailAndPassword(email: email, password: password);

        // add user to our database

        res = 'success';
      }else{
        res = 'Enter all fields';
      }
    }catch(err){
      res = err.toString();
    }
    return res;
  }

  void logginginUser()async{
    String res = await logInUser(email: emailController.text, password: passwordController.text);
    if(res == 'success'){
      Get.toNamed(Routes.BOTTOMTABS);
    }else{
      Get.snackbar(res, "User not found");
    }

  }
}
