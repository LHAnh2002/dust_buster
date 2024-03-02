import 'package:dust_buster/app/common/util/exports.dart';
import 'package:dust_buster/app/modules/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getTime();
    return Scaffold(
      backgroundColor: AppColors.kGreenChart,
      body: Center(
        child: Text(
          'Logo',
          style: AppTextStyle.text24BoldStyle.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
