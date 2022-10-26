import 'package:feuzion/controllers/add_player_controller.dart';
import 'package:feuzion/core/widgets/login_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../core/colors.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/form_validators.dart';
import '../../core/widgets/my_text_field.dart';
import '../../core/widgets/text_button.dart';

class AddPlayerView extends GetView<AddPlayerController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: "Add Player",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  SizedBox(
                    height: 34,
                  ),
                  SvgPicture.asset(
                    "assets/icons/add_player_profile.svg",
                    height: 104,
                    width: 101,
                  ),
                  SizedBox(
                    height: 41,
                  ),
                  LoginFields(
                    hintText: 'First Name',
                    fieldValidator: nameValidator,
                    controller: controller.firstNameController,
                  ),
                  // MyTextField(
                  //   labelText: 'First Name',
                  //   controller: controller.firstNameController,
                  //   fieldvalidator: nameValidator,
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  // MyTextField(
                  //   labelText: 'Last Name',
                  //   fieldvalidator: nameValidator,
                  //   controller: controller.lastNameController,
                  // ),
                  LoginFields(
                    hintText: 'Last Name',
                    fieldValidator: nameValidator,
                    controller: controller.lastNameController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    labelText: 'Date of Birth',
                    controller: controller.dobController,
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
                      controller.dobChanged(date!);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: 173.54,
                          child: LoginFields(
                            hintText: 'Age',
                            controller: controller.ageController,
                            fieldValidator: ageValidator,
                          )
                          //
                          // MyTextField(
                          //   labelText: 'Age',
                          //   controller: controller.ageController,
                          // ),
                          ),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: SizedBox(
                            width: 173.54,
                            child: LoginFields(
                              hintText: 'Weight',
                              fieldValidator: weightValidator,
                              controller: controller.weightController,
                            )
                          // MyTextField(
                          //   labelText: 'Weight',
                          //   controller: controller.weightController,
                          //   fieldvalidator: weightValidator,
                          // ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: 173.54,
                          child: LoginFields(
                            hintText: 'Height',
                            fieldValidator: heightValidator,
                            controller: controller.heightController, 
                          )
                          //
                          // MyTextField(
                          //   labelText: 'Height',
                          //   controller: controller.heightController,
                          //   fieldvalidator: heightValidator,
                          // ),
                          ),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: SizedBox(
                            width: 173.54,
                            child: LoginFields(
                              hintText: 'Position',
                              controller: controller.positionController,
                              fieldValidator: positionValidator,
                            )
                            // MyTextField(
                            //   labelText: 'Position',
                            //   controller: controller.positionController,
                            // ),
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      controller.checkLogin();
                      controller.addplayer();
                    },
                    child: TextButtonWidget(text: "Save"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
