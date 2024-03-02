import 'package:dust_buster/app/modules/work/exports.dart';
import 'package:get/get.dart';

class WorkBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkController>(() => WorkController());
  }
}
