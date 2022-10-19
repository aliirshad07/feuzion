import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../core/routes/app_pages.dart';

class AddPlayerController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController positionController = TextEditingController();

  final _firestore = FirebaseFirestore.instance;

  void dobChanged(DateTime date) {
    if (date != null) {
      dobController.text = date.toString().split(' ')[0];
    }
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
    lastNameController.dispose();
    firstNameController.dispose();
    positionController.dispose();
    heightController.dispose();
    weightController.dispose();
    ageController.dispose();

    super.dispose();
  }

  void checkLogin(){
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
  }

  void addplayer()async{
    if(firstNameController.text.isNotEmpty ||
        lastNameController.text.isNotEmpty ||
        dobController.text.isNotEmpty ||
        ageController.text.isNotEmpty ||
        weightController.text.isNotEmpty ||
        heightController.text.isNotEmpty ||
        positionController.text.isNotEmpty
    ){
      _firestore.collection('players').doc().set({
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "DOB": dobController.text,
        "age": ageController.text,
        "weight": weightController.text,
        "height": heightController.text,
        "position": positionController.text
      });
      Get.toNamed(Routes.PLAYERLEVEL);
    }else{
      Get.snackbar("Empty Fields", "Please enter all fields");
    }
  }
}
