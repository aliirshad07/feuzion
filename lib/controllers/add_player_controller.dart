import 'package:feuzion/core/collections.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../core/routes/app_pages.dart';

class AddPlayerController extends GetxController {
  String? uid = Get.parameters["uid"];

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  int playerNumber = 1;

  void dobChanged(DateTime date) {
    if (date != null) {
      dobController.text = date.toString().split(' ')[0];
    }
    update();
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

  void addPlayer()async{
    if(!formKey.currentState!.validate()) return;

    await usersCollection.doc(uid).collection("players").add({
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
      "dob": dobController.text,
      "age": ageController.text,
      "weight": weightController.text,
      "height": heightController.text,
      "position": positionController.text,
      "playerNumber": playerNumber,
    });
    Get.toNamed(Routes.PLAYERLEVEL);
    playerNumber++;
  }
}
