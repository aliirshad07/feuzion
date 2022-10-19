import 'package:feuzion/views/login_views/diet_plan_view.dart';
import 'package:feuzion/views/login_views/payment_successful_view.dart';
import 'package:feuzion/views/login_views/payment_view.dart';
import 'package:feuzion/views/players%20view/player_education_view.dart';
import 'package:feuzion/views/players%20view/player_over_all_performance_view.dart';
import 'package:feuzion/views/players%20view/player_profile_view.dart';
import 'package:feuzion/views/players%20view/player_social_view.dart';
import 'package:feuzion/views/players%20view/player_technical_form.dart';
import 'package:feuzion/views/players%20view/player_technical_view.dart';
import 'package:feuzion/views/players%20view/players_view.dart';
import 'package:get/get.dart';

import '../../core/bindings.dart';

import '../../views/login_views/bottom_tabs_view.dart';
import '../../views/login_views/home_view.dart';
import '../../views/login_views/login_view.dart';
import '../../views/login_views/payment_option_view.dart';
import '../../views/login_views/signup2_view.dart';
import '../../views/login_views/signup_view.dart';

import '../../views/login_views/splash_view.dart';
import '../../views/players view/add_player_view.dart';

import '../../views/players view/player_athletic_view.dart';
import '../../views/players view/player_levels_view.dart';
import '../../views/players view/player_performance_view.dart';
import '../../views/players view/player_psychology_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Paths.SPLASH;

  static final routes = [
    GetPage(
      name: Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Paths.HOME,
      page: () => const HomeView(),
      binding: HomeViewBinding(),
    ),
    GetPage(
      name: Paths.BOTTOMTABS,
      page: () => BottomTabsView(),
      binding: BottomTabsBinding(),
    ),
    GetPage(
      name: Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Paths.SIGNUP2,
      page: () => const Signup2View(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Paths.PAYMENT,
      page: () => const PaymentOptionView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: Paths.PAYMENTVIEW,
      page: () => const PaymentView(),
      binding: PaymentViewBinding(),
    ),
    GetPage(
      name: Paths.PAYMENTSUCCESSFUL,
      page: () => PaymentSuccessfulView(),
      binding: PaymentSuccessfulViewBinding(),
    ),
    GetPage(
      name: Paths.PLAYERVIEW,
      page: () => PlayersView(),
      binding: PlayerViewBinding(),
    ),
    GetPage(
      name: Paths.ADDPLAYER,
      page: () => AddPlayerView(),
      binding: AddPlayerBinding(),
    ),
    GetPage(
      name: Paths.PLAYERLEVEL,
      page: () => const PlayerLevelView(),
      binding: PlayerLevelBinding(),
    ),
    GetPage(
      name: Paths.PLAYERVIEWPROFILE,
      page: () => PlayerProfileView(),
      binding: PlayerViewProfileBinding(),
    ),
    GetPage(
      name: Paths.PLAYERPERFORMACE,
      page: () => const PlayerPerformanceView(),
      binding: PlayerPerformanceBinding(),
    ),
    GetPage(
      name: Paths.PLAYEOVERALLRPERFORMACE,
      page: () => const PlayerOverAllPerformanceView(),
      binding: PlayerOverAllPerformanceBinding(),
    ),
    GetPage(
      name: Paths.PLAYERAESTHETIC,
      page: () => const PlayerAthleticView(),
      binding: PlayerAestheticBinding(),
    ),
    GetPage(
      name: Paths.PLAYERPYSCHOLOGY,
      page: () => const PlayerPsychologyView(),
      binding: PlayerPyschologyBinding(),
    ),
    GetPage(
      name: Paths.PLAYEREDUCATION,
      page: () => const PlayerEducationView(),
      binding: PlayerEducationBinding(),
    ),
    GetPage(
      name: Paths.PLAYERSOCIAL,
      page: () => PlayerSocialView(),
      binding: PlayerSocialBinding(),
    ),
    GetPage(
      name: Paths.TECHNINCALFORM,
      page: () => const PlayerTechnicalForm(),
      binding: PlayerTechnicalFormBinding(),
    ),
    GetPage(
      name: Paths.PLAYERTECHNINCAL,
      page: () => PlayerTechnicalViewTwo(),
      binding: PlayerTechnicalBinding(),
    ),
    GetPage(
      name: Paths.DIETPLAN,
      page: () => DietPlanView(),
      binding: DietPlanBinding(),
    ),
  ];
}
