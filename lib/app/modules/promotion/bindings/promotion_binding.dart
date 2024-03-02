import 'package:get/get.dart';

import '../exports.dart';

class PromotionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PromotionController>(() => PromotionController());
  }
}
