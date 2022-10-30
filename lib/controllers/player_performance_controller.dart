import 'package:get/get.dart';

class PlayerPerformanceController extends GetxController {



  //TODO: Implement HomeController

  final count = 0.obs;
  final initialKickPower = 0.obs;
  final initialGames = 0.obs;
  final initialFouls = 0.obs;
  final initialMinutesPlayed = 0.obs;
  final initialShortOnTarget = 0.obs;
  final initialSaves = 0.obs;
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
