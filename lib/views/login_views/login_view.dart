import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/login_controller.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../core/routes/app_pages.dart';
import '../../core/widgets/form_validators.dart';
import '../../core/widgets/login_field.dart';
import '../../core/widgets/my_button.dart';

LoginController controller = Get.put(LoginController());

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    SizedBox(
                      child: Image.asset('assets/images/logo.png',
                          color: kWhiteColor),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    //Empty Container for layout
                    Form(
                      key: controller.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
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
                              controller.checkLogin();
                              controller.logginginUser();
                            },
                            text: 'LOGIN',
                            textColor: kWhiteColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.SIGNUP2),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(
                            color: kHintTextColor,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(text: 'Don’t have an account? '),
                            TextSpan(
                              text: 'Sign Up',
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
