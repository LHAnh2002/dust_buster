import 'package:dust_buster/app/common/util/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../exports.dart';

class NavigationBarView extends GetView<NavigationBarController> {
  const NavigationBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark,
    );
    return Scaffold(
      body: Obx(
        () => controller.srceens[controller.selecteIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          elevation: 0,
          selectedIndex: controller.selecteIndex.value,
          onDestinationSelected: (index) =>
              controller.selecteIndex.value = index,
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset(
                AppImages.homePage,
                width: 24.w,
                height: 24.h,
              ),
              label: Strings.homePage,
            ),
            NavigationDestination(
              icon: Icon(
                Ionicons.document_text_outline,
                size: 24.w,
              ),
              label: Strings.work,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                AppImages.promotions,
                width: 24.w,
                height: 24.h,
              ),
              label: Strings.promotion,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                AppImages.notification,
                width: 24.w,
                height: 24.h,
              ),
              label: Strings.notification,
            ),
            NavigationDestination(
              icon: Icon(
                Ionicons.person_outline,
                size: 24.w,
              ),
              label: Strings.account,
            ),
          ],
        ),
      ),
    );
  }
}
