import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/signup_controller.dart';
import '../../core/colors.dart';
import '../../core/routes/app_pages.dart';
import '../../core/widgets/form_validators.dart';
import '../../core/widgets/login_field.dart';
import '../../core/widgets/my_button.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    SizedBox(
                      child: Image.asset('assets/images/logo.png',
                          color: kWhiteColor),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    //Empty Container for layout
                    Form(
                      key: controller.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          LoginFields(
                            hintText: 'First Name',
                            controller: controller.firstNameController,
                            fieldValidator: nameValidator,
                          ),
                          LoginFields(
                            hintText: 'Last Name',
                            controller: controller.lastNameController,
                            fieldValidator: nameValidator,
                          ),
                          LoginFields(
                            hintText: 'Email',
                            controller: controller.emailController,
                            fieldValidator: emailValidator,
                          ),
                          LoginFields(
                            hintText: 'Password',
                            obSecure: true,
                            controller: controller.passwordController,
                            fieldValidator: passwordValidator,
                          ),
                          MyButton(
                            onPressed: () {
                              controller.signingupUser();
                            },
                            text: 'SIGNUP',
                            textColor: kWhiteColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
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
                            TextSpan(text: 'Already have an account? '),
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                fontSize: 18,
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
