import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PlayerAestheticController extends GetxController {
  final count = 0.obs;
  final initialStrength = 0.obs;
  final initialIntelligence = 0.obs;
  final initialAgility = 0.obs;
  final initialSpeed = 0.obs;
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
