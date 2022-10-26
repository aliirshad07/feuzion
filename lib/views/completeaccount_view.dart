import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/completeaccount_controller.dart';
import '../core/colors.dart';
import '../core/constants.dart';
import '../core/math_utils.dart';
import '../core/widgets/form_validators.dart';
import '../core/widgets/login_field.dart';
import 'package:intl/intl.dart';

class CompleteAccountView extends GetView<CompleteAccountController> {
  const CompleteAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          children: [
            Container(
              height: getHorizontalSize(200),
              width: getHorizontalSize(200),
              alignment: Alignment.bottomCenter,
              child: Stack(children: [
                Container(
                  height: getHorizontalSize(101),
                  width: getHorizontalSize(101),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: Obx(
                    () => ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: controller.imagePath.value.isNotEmpty
                          ? Image.file(File(controller.imagePath.value))
                          : CircleAvatar(
                              backgroundColor: const Color(0xff17344C),
                              child: Image.asset('assets/icons/profil_icon.png'),
                            ),
                    ),
                  ),
                ),
                Positioned(
                  right: -5,
                  bottom: -10,
                  child: IconButton(
                      onPressed: () => controller.pickUploadOption(),
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                        size: 17,
                      )),
                ),
              ]),
            ),

            SizedBox(height: context.height * 0.05),
            //Empty Container for layout
            Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LoginFields(
                    hintText: 'Username',
                    controller: controller.usernameController,
                    fieldValidator: nameValidator,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextField(
                      readOnly: true,
                      style: InputStyling.textStyle,
                      controller: controller.dobController,
                      decoration: InputDecoration(
                        hintText: 'Birth of Date (DD MM YYYY)',
                        hintStyle: InputStyling.hintStyle,
                        contentPadding: InputStyling.padding,
                        border: InputStyling.inputEnableBorder,
                        enabledBorder: InputStyling.inputEnableBorder,
                        focusedBorder: InputStyling.inputFocusBorder,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      onTap: () async {
                        // hide keyboard
                        FocusScope.of(context).unfocus();
                        var date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          builder: (context, child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                  primaryColor: kSecondaryColor,
                                  colorScheme: const ColorScheme.light(primary: kSecondaryColor).copyWith(secondary: kSecondaryColor)),
                              child: child!,
                            );
                          },
                        );
                        controller.dobController.text = DateFormat("dd-MM-yyyy").format(date!);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextField(
                      readOnly: true,
                      style: InputStyling.textStyle,
                      controller: controller.genderController,
                      decoration: InputDecoration(
                        hintText: 'Gender',
                        hintStyle: InputStyling.hintStyle,
                        contentPadding: InputStyling.padding,
                        border: InputStyling.inputEnableBorder,
                        enabledBorder: InputStyling.inputEnableBorder,
                        focusedBorder: InputStyling.inputFocusBorder,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      onTap: () => controller.pickGender(),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () => controller.createProfile(),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: kWhiteColor,
                        elevation: 0,
                        backgroundColor: kSecondaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 15)),
                    child: Text("Create Profile", style: fontRoboto(fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () => {},
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    color: kHintTextColor,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: 'Need Help?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        color: kWhiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
