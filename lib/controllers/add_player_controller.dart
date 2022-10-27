import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feuzion/core/collections.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../core/constants.dart';
import '../core/math_utils.dart';
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

  RxString imagePath = "".obs;
  final ImagePicker imagePicker = ImagePicker();

  void dobChanged(DateTime date) {
    if (date != null) {
      dobController.text = date.toString().split(' ')[0];
    }
    update();
  }

  pickUploadOption() async {
    var data = await Get.bottomSheet(
      BottomSheet(
        onClosing: () {},
        builder: (BuildContext context) {
          return SizedBox(
            height: getVerticalSize(120),
            child: ListView(
              children: [
                ListTile(
                  title: const Text(
                    'Gallery',
                  ),
                  onTap: () {
                    Get.back(result: true);
                  },
                ),
                ListTile(
                  title: const Text('Camera'),
                  onTap: () {
                    Get.back(result: false);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
    pickImage(gallery: data);
  }

  void pickImage({bool gallery = false}) async {
    final XFile? image = await imagePicker.pickImage(source: gallery ? ImageSource.gallery : ImageSource.camera);
    if (image == null) return;
    imagePath.value = image.path;
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

  void checkLogin() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
  }

  void addPlayer() async {
    if (!formKey.currentState!.validate()) return;

    if (imagePath.isEmpty) {
      customToast("Upload player picture");
      return;
    }

    String imageURL = "";

    final storageRef = FirebaseStorage.instance.ref();

    String ext = imagePath.value.split(".").last;
    int fileName = DateTime.now().millisecondsSinceEpoch;

    try {
      final postRef = storageRef.child("players/$uid/player_$fileName.$ext");
      await postRef.putFile(File(imagePath.value));
      imageURL = await postRef.getDownloadURL();

      await usersCollection.doc(uid).collection("players").add({
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "dob": dobController.text,
        "age": ageController.text,
        "weight": weightController.text,
        "height": heightController.text,
        "position": positionController.text,
        "picture": imageURL,
        "level": 0,
      });

      customToast("Player added");
      Get.back();
    } on FirebaseException catch (e) {
      customToast(e.code);
    }
  }
}
