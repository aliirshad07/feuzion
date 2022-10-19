import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PlayerLevelsController extends GetxController {
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
