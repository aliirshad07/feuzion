import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:feuzion/views/login_views/signup2_view.dart';
import '../core/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupController extends GetxController {
  //TODO: Implement HomeController

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController userNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  void dobChanged(DateTime? date) {
    if (date != null) {
      dobController.text = date.toString().split(' ')[0];
    }
    update();
  }

  void genderChange(String data) {
    genderController.text = data;
    update();
  }

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
    lastNameController.dispose();
    firstNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signUpUser({
    required String username,
    required DOB,
    required gender
  }){
    if(username.isNotEmpty || DOB.isNotEmpty || gender.isNotEmpty){
      Get.toNamed(Routes.SIGNUP);
    }else{
      Get.snackbar('Empty fields', 'Please enter all the fields');
    }
  }
  Future<String> signUpUsertwo({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  })async{

    String res = 'An error occurred';
    try{
      if(firstName.isNotEmpty || lastName.isNotEmpty || email.isNotEmpty || password.isNotEmpty){

        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        _firestore.collection('users').doc(cred.user!.uid).set({
          "firstName" : firstName,
          "lastName": lastName,
          "email": email,
          "username": userNameController.text,
          "DOB": dobController.text,
          "gender": genderController.text
        });
        res = 'success';
      }
    }catch(e){
      res = e.toString();
    }
    return res;
  }


  void signingupUser()async{

    String res = await signUpUsertwo(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: passwordController.text
    );
    
    if(res == 'success'){
      Get.toNamed(Routes.HOME);
    }else{
      Get.snackbar(res, "Invalid user format");
    }

  }
}
