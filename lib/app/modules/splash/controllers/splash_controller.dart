import 'dart:async';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  void getTime() {
    Timer(const Duration(seconds: 2), () {
      Get.offNamed(Routes.navigationBar);
    });
  }
}
