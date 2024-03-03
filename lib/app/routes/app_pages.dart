import 'package:get/get.dart';
import '../modules/create_account/exports.dart';
import '../modules/forgot_password/exports.dart';
import '../modules/home/exports.dart';
import '../modules/login/exports.dart';
import '../modules/navigation_bar/exports.dart';
import '../modules/splash/exports.dart';
part 'app_routes.dart';

class AppPages {
  const AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.splash,
      transition: Transition.fadeIn,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.login,
      transition: Transition.fadeIn,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.create_account,
      transition: Transition.rightToLeftWithFade,
      page: () => const CreateAccountView(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: _Paths.forgot_password,
      transition: Transition.rightToLeftWithFade,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.navigationBar,
      transition: Transition.rightToLeftWithFade,
      page: () => const NavigationBarView(),
      binding: NavigationBarBinding(),
    ),
  ];
}
