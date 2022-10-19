import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/signup_controller.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../core/math_utils.dart';
import '../../core/routes/app_pages.dart';
import '../../core/widgets/form_validators.dart';
import '../../core/widgets/login_field.dart';
import '../../core/widgets/my_button.dart';

class Signup2View extends GetView<SignupController> {
  const Signup2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          child: CircleAvatar(
                            backgroundColor: const Color(0xff17344C),
                            child: Image.asset('assets/icons/profil_icon.png'),
                          ),
                        ),
                        Positioned(
                          right: -5,
                          bottom: -10,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_a_photo,
                                color: Colors.white,
                                size: 17,
                              )),
                        ),
                      ]),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    //Empty Container for layout
                    Form(
                      key: controller.formKey2,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          LoginFields(
                            hintText: 'Username',
                            controller: controller.userNameController,
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
                                          accentColor: kSecondaryColor,
                                          colorScheme: const ColorScheme.light(
                                              primary: kSecondaryColor)),
                                      child: child!,
                                    );
                                  },
                                );
                                controller.dobChanged(date);
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
                              onTap: () async {
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
                                controller.genderChange(data);
                                print(data);
                              },
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(40),
                          ),
                          MyButton(
                            onPressed: () {
                              controller.signUpUser(username: controller.userNameController.text, DOB: controller.dobController.text, gender: controller.genderController.text);
                              // if (!controller.formKey.currentState!.validate()) {
                              //   return;
                              // };
                            },
                            text: 'Create Profile',
                            textColor: kWhiteColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(10),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.LOGIN),
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
            ],
          ),
        ),
      ),
    );
  }
}
