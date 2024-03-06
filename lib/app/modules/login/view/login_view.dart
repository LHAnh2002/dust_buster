import 'package:dust_buster/app/common/util/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../exports.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100.h),
                const LogoWinget(),
                SizedBox(height: 45.h),
                Text(
                  Strings.login,
                  style: AppTextStyle.text24BoldStyle
                      .copyWith(color: Colors.black),
                ),
                SizedBox(height: 10.h),
                TextFormWidget(
                  controller: controller.textEmailController,
                  hintText: Strings.email,
                  textInputType: TextInputType.emailAddress,
                  obscureText: false.obs,
                  togglePasswordVisibility: () {},
                  showButton: false,
                  onChanged: (value) {},
                ),
                SizedBox(height: 10.h),
                GetBuilder<LoginController>(
                  builder: (controller) {
                    return TextFormWidget(
                      controller: controller.textPasswordController,
                      hintText: Strings.password,
                      textInputType: TextInputType.text,
                      obscureText: controller.isPasswordVisible,
                      togglePasswordVisibility: () {
                        controller.togglePasswordVisibility();
                      },
                      showButton: true,
                      onChanged: (value) {},
                    );
                  },
                ),
                SizedBox(height: 10.h),
                Obx(
                  () => Column(
                    children: [
                      if (controller.ispasswordOrEmailNull.value == true)
                        Text(
                          Strings.passwordOrEmailNull,
                          style: AppTextStyle.bodySmallStyle
                              .copyWith(color: Colors.red, fontSize: 12.sp),
                        ),
                      if (controller.isPasswordOrEmailIncorrect.value == true)
                        Text(
                          Strings.passwordOrEmailIncorrect,
                          style: AppTextStyle.bodySmallStyle
                              .copyWith(color: Colors.red, fontSize: 12.sp),
                        ),
                      if (controller.isyourAccountBan.value == true)
                        Text(
                          Strings.yourAccountBan,
                          style: AppTextStyle.bodySmallStyle
                              .copyWith(color: Colors.red, fontSize: 12.sp),
                        )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 10.h),
            ButtonWidget(
              onTap: () {
                controller.login();
              },
              text: Strings.login,
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(Strings.notAccount),
                SizedBox(width: 10.h),
                TextButtonWidget(
                  onTap: () {
                    Get.toNamed(Routes.createAccount);
                  },
                  text: Strings.createAccount,
                )
              ],
            ),
            TextButtonWidget(
              onTap: () {
                Get.toNamed(Routes.forgotPassword);
              },
              text: Strings.forgotPassword,
            ),
          ],
        ),
      ),
    );
  }
}
