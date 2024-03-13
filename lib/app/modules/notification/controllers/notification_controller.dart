import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  var selectedIndex = 0.obs;

  void selectTab(int index) {
    selectedIndex.value = index;
  }
}
