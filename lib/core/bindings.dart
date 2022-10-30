import 'package:feuzion/controllers/completeaccount_controller.dart';
import 'package:feuzion/controllers/diet_plan_controller.dart';
import 'package:feuzion/controllers/payment_view_controller.dart';
import 'package:feuzion/controllers/player_aesthetic_controller.dart';
import 'package:feuzion/controllers/player_education_controller.dart';
import 'package:feuzion/controllers/player_over_all_performance_controller.dart';
import 'package:feuzion/controllers/player_physchology_controller.dart';
import 'package:get/get.dart';
import '../controllers/add_player_controller.dart';
import '../controllers/root_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/payment_controller.dart';
import '../controllers/payment_successfull_controller.dart';
import '../controllers/player_performance_controller.dart';
import '../controllers/player_profile_controller.dart';
import '../controllers/player_social_controller.dart';
import '../controllers/player_technical_controller.dart';
import '../controllers/player_technical_form_controller.dart';
import '../controllers/signup_controller.dart';
import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashController(),
    );
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
  }
}

class CompleteAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompleteAccountController>(
      () => CompleteAccountController(),
    );
  }
}

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController());
  }
}

class AddPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPlayerController>(
          () => AddPlayerController(),
    );
  }
}

class PlayerDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerDetailsController>(
          () => PlayerDetailsController(),
    );
  }
}

// ###############################################################################

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(
      () => PaymentController(),
    );
  }
}

class PaymentViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentViewController>(
      () => PaymentViewController(),
    );
  }
}

class PaymentSuccessfulViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentSuccessfulController>(
      () => PaymentSuccessfulController(),
    );
  }
}



class PlayerPerformanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerPerformanceController>(
      () => PlayerPerformanceController(),
    );
  }
}

class PlayerOverAllPerformanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerOverAlllPerformanceController>(
      () => PlayerOverAlllPerformanceController(),
    );
  }
}

class PlayerTechnicalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerTechnicalController>(
      () => PlayerTechnicalController(),
    );
  }
}

class PlayerAestheticBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerAestheticController>(
      () => PlayerAestheticController(),
    );
  }
}

class PlayerPyschologyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerAestheticController>(
      () => PlayerAestheticController(),
    );
    Get.lazyPut<PlayerPyschologyController>(
          () => PlayerPyschologyController(),
    );
  }
}

class PlayerEducationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerEducationController>(
      () => PlayerEducationController(),
    );
  }
}

class PlayerSocialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerSocialController>(
      () => PlayerSocialController(),
    );
  }
}

class PlayerTechnicalFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerTechnicalFormController>(
      () => PlayerTechnicalFormController(),
    );
  }
}

class DietPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DietPlanController>(
      () => DietPlanController(),
    );
  }
}



