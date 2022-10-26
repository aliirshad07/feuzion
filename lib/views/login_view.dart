import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../core/colors.dart';
import '../core/constants.dart';
import '../core/routes/app_pages.dart';
import '../core/widgets/form_validators.dart';
import '../core/widgets/login_field.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          children: [
            SizedBox(
              height: context.height * 0.2,
            ),
            Center(
              child: Image.asset('assets/images/logo.png', color: kWhiteColor),
            ),
            SizedBox(height: context.height * 0.1),
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

                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => controller.loginUser(),
              style: ElevatedButton.styleFrom(
                  foregroundColor: kWhiteColor,
                  elevation: 0,
                  backgroundColor: kSecondaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 15)),
              child: Text("LOGIN", style: fontRoboto(fontSize: 20, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.SIGNUP),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Don’t have an account? ',
                  style: fontRoboto(
                    color: kHintTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: fontRoboto(
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
