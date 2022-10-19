import 'package:get/get.dart';

import '../core/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 2));
    Get.toNamed(Routes.LOGIN);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
