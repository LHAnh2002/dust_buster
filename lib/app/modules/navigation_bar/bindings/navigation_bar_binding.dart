import 'package:dust_buster/app/modules/navigation_bar/controllers/navigation_bar_controller.dart';
import 'package:get/get.dart';

import '../../home/exports.dart';

class NavigationBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationBarController>(() => NavigationBarController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
