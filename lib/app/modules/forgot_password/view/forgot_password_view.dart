import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/util/exports.dart';
import '../../create_account/exports.dart';
import '../../login/exports.dart';
import '../controllers/forgot_password_controller.dart';
import '../exports.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_rounded),
        ),
        title: Text(
          Strings.forgotPassword,
          style: AppTextStyle.text24BoldStyle
              .copyWith(fontSize: 20.sp, color: AppColors.black),
        ),
      ),
      body: Container(
        padding:
            const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 20).r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.emailYourAre,
                  style: AppTextStyle.semiBoldBigStyle
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
                  onChanged: (value) {
                    controller.checkEmailFormat(value);
                  },
                ),
                SizedBox(width: 0.0, height: 5.h),
                Text(
                  Strings.notEmail,
                  style: AppTextStyle.bodySmallStyle
                      .copyWith(color: Colors.red, fontSize: 12.sp),
                ),
              ],
            ),
            Stack(
              children: [
                Center(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      String email = controller.textEmailController.value.text;
                      Get.bottomSheet(
                        Container(
                          padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 20)
                              .r,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child: OtpForgotPasswordWidget(
                            email: email,
                            controller: CreateAccountController(),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 45.h,
                      decoration: BoxDecoration(
                        color: AppColors.kButtonColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(8).r,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.kButtonColor.withOpacity(0.2),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Text(
                        Strings.continues,
                        style: AppTextStyle.buttonTextStyle.copyWith(
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
