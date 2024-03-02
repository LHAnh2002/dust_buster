import 'package:dust_buster/app/modules/notification/exports.dart';
import 'package:dust_buster/app/modules/promotion/views/promotion_view.dart';
import 'package:dust_buster/app/modules/work/exports.dart';
import 'package:get/get.dart';

import '../../account/exports.dart';
import '../../home/exports.dart';

class NavigationBarController extends GetxController {
  final Rx<int> selecteIndex = 0.obs;

  final srceens = [
    const HomeView(),
    const WorkView(),
    const PromotionView(),
    const NotificationView(),
    const AccountView(),
  ];
}
