import 'dart:io';

import 'package:feuzion/core/collections.dart';
import 'package:feuzion/core/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../core/math_utils.dart';

class CompleteAccountController extends GetxController {
  String? uid = Get.parameters["uid"];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController(),
      dobController = TextEditingController(),
      genderController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  RxString imagePath = "".obs;

  createProfile() async {
    if (!formKey.currentState!.validate()) return;

    if (imagePath.isEmpty) {
      customToast("Upload profile picture");
      return;
    }

    String imageURL = "";

    final storageRef = FirebaseStorage.instance.ref();

    String ext = imagePath.value.split(".").last;
    int fileName = DateTime.now().millisecondsSinceEpoch;

    try {
      final postRef = storageRef.child("users/$uid/pp_$fileName.$ext");
      await postRef.putFile(File(imagePath.value));
      imageURL = await postRef.getDownloadURL();

      await usersCollection.doc(uid).update({
        "username": usernameController.text,
        "dob": dobController.text,
        "gender": genderController.text,
        "profilePicture": imageURL,
      });
      customToast("Profile created");
      Get.offAllNamed("/root", parameters: {"uid": uid!});
    } on FirebaseException catch (e) {
      customToast(e.code);
    }
  }

  pickGender() async {
    var data = await Get.bottomSheet(
      BottomSheet(
        onClosing: () {},
        builder: (BuildContext context) {
          return SizedBox(
            height: getVerticalSize(160),
            child: ListView(
              children: [
                ListTile(
                  title: const Text(
                    'Male',
                  ),
                  onTap: () {
                    Get.back(result: 'Male');
                  },
                ),
                ListTile(
                  title: const Text('Female'),
                  onTap: () {
                    Get.back(result: 'Female');
                  },
                ),
                ListTile(
                  title: const Text('Other'),
                  onTap: () {
                    Get.back(result: 'Other');
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
    genderController.text = data;
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
  void onClose() {
    usernameController.dispose();
    dobController.dispose();
    genderController.dispose();
    super.onClose();
  }
}
