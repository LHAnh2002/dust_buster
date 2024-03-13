import 'package:dust_buster/app/common/util/exports.dart';
import 'package:dust_buster/app/common/values/styles/app_text_style.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/widgets/button_widget.dart';
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
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 0.0, height: 24.h),
            const LogoWinget(),
            SizedBox(width: 0.0, height: 68.h),
            Text(
              textAlign: TextAlign.center,
              Strings.plsLogin,
              style: AppTextStyle.lableBodyStyle,
            ),
            SizedBox(height: 16.h),
            TextFormWidget(
              controller: controller.textEmailController,
              hintText: Strings.email,
              textInputType: TextInputType.emailAddress,
              obscureText: false.obs,
              togglePasswordVisibility: () {},
              showButton: false,
              onChanged: (value) {},
            ),
            SizedBox(height: 16.h),
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
            Obx(
              () => Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    if (controller.ispasswordOrEmailNull.value == true)
                      Text(
                        Strings.passwordOrEmailNull,
                        style: AppTextStyle.textsmallStyle
                            .copyWith(color: Colors.red, fontSize: 12.sp),
                      ),
                    if (controller.isPasswordOrEmailIncorrect.value == true)
                      Text(
                        Strings.passwordOrEmailIncorrect,
                        style: AppTextStyle.textsmallStyle
                            .copyWith(color: Colors.red, fontSize: 12.sp),
                      ),
                    if (controller.isyourAccountBan.value == true)
                      Text(
                        Strings.yourAccountBan,
                        style: AppTextStyle.textsmallStyle
                            .copyWith(color: Colors.red, fontSize: 12.sp),
                      )
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            ButtonWidget(
              boder: false.obs,
              onTap: () {
                controller.login();
              },
              text: Strings.login,
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  Strings.notAccount,
                  style: AppTextStyle.textsmallStyle,
                ),
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
