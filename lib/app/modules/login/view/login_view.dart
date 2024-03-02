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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 0.0, height: 100.h),
                const LogoWinget(),
                SizedBox(width: 0.0, height: 45.h),
                Text(
                  Strings.login,
                  style: AppTextStyle.text24BoldStyle
                      .copyWith(color: Colors.black),
                ),
                SizedBox(width: 0.0, height: 10.h),
                TextFormWidget(
                  controller: controller.textEmailController,
                  hintText: Strings.email,
                  textInputType: TextInputType.emailAddress,
                  obscureText: false.obs,
                  togglePasswordVisibility: () {},
                  showButton: false,
                  onChanged: (value) {},
                ),
                SizedBox(width: 0.0, height: 10.h),
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
                SizedBox(width: 0.0, height: 10.h),
                Text(
                  Strings.passwordOrEmailIncorrect,
                  style: AppTextStyle.bodySmallStyle
                      .copyWith(color: Colors.red, fontSize: 12.sp),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(width: 0.0, height: 10.h),
                ButtonWidget(
                  onTap: () {},
                  text: Strings.login,
                ),
                SizedBox(width: 0.0, height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(Strings.notAccount),
                    SizedBox(width: 10.h),
                    TextButtonWidget(
                      onTap: () {
                        Get.toNamed(Routes.create_account);
                      },
                      text: Strings.createAccount,
                    )
                  ],
                ),
                TextButtonWidget(
                  onTap: () {
                    Get.toNamed(Routes.forgot_password);
                  },
                  text: Strings.forgotPassword,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
