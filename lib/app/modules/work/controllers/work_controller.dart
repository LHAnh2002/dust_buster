import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }
}
