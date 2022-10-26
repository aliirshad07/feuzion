import 'package:feuzion/controllers/add_player_controller.dart';
import 'package:feuzion/core/widgets/login_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../core/colors.dart';
import '../core/constants.dart';
import '../core/widgets/form_validators.dart';
import '../core/widgets/my_text_field.dart';

class AddPlayerView extends GetView<AddPlayerController> {
  const AddPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhiteColor,
          iconTheme: const IconThemeData(color: kBlackColor),
          title: Text("Add Player", style: fontRoboto(fontSize: 24, fontWeight: FontWeight.w500, color: kBlackColor)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const SizedBox(height: 35),
                  SvgPicture.asset(
                    "assets/icons/add_player_profile.svg",
                    height: 104,
                    width: 101,
                  ),
                  const SizedBox(height: 40),
                  LoginFields(
                    hintText: 'First Name',
                    fieldValidator: nameValidator,
                    controller: controller.firstNameController,
                  ),
                  const SizedBox(height: 10),
                  LoginFields(
                    hintText: 'Last Name',
                    fieldValidator: nameValidator,
                    controller: controller.lastNameController,
                  ),
                  const SizedBox(height: 10),
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
                                colorScheme: const ColorScheme.light(primary: kSecondaryColor).copyWith(secondary: kSecondaryColor)),
                            child: child!,
                          );
                        },
                      );
                      controller.dobChanged(date!);
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: context.width / 2 - 30,
                        child: LoginFields(
                          hintText: 'Age',
                          controller: controller.ageController,
                          fieldValidator: ageValidator,
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: context.width / 2 - 30,
                        child: LoginFields(
                          hintText: 'Weight',
                          fieldValidator: weightValidator,
                          controller: controller.weightController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: context.width / 2 - 30,
                        child: LoginFields(
                          hintText: 'Height',
                          controller: controller.heightController,
                          fieldValidator: heightValidator,
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: context.width / 2 - 30,
                        child: LoginFields(
                          hintText: 'Position',
                          fieldValidator: positionValidator,
                          controller: controller.positionController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => controller.addPlayer(),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: kWhiteColor,
                        elevation: 0,
                        backgroundColor: kSecondaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 15)),
                    child: Text("Save", style: fontRoboto(fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
