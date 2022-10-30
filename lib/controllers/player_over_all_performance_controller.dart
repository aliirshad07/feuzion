import 'package:get/get.dart';

class PlayerOverAlllPerformanceController extends GetxController {
  //TODO: Implement HomeController

  final initialTechnical = 0.obs;
  final initialAthletic = 0.obs;
  final initialPsychology = 0.obs;
  final initialEducation = 0.obs;
  final initialSocial = 0.obs;

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
