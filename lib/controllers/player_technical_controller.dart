import 'package:get/get.dart';

class PlayerTechnicalController extends GetxController {
  //TODO: Implement HomeController

  final initialTouch = 0.obs;
  final initialIntelligence = 0.obs;

  final count = 0.obs;
  @override
  void onInit() async {
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

  void increment() => count.value++;
}
