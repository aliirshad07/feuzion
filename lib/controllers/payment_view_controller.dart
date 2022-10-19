import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PaymentViewController extends GetxController {
  //TODO: Implement PaymentViewController

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController cardnumberController = TextEditingController();
  TextEditingController expirydateController = TextEditingController();
  TextEditingController cvvnumberController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  void dobChanged(DateTime? date) {
    if (date != null) {
      dobController.text = date.toString().split(' ')[0];
    }
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    cardnumberController.dispose();
    expirydateController.dispose();
    cvvnumberController.dispose();
    super.dispose();
  }
}
