import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/util/exports.dart';
import '../../login/exports.dart';
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
                Obx(
                  () {
                    if (controller.isEmailNull.value ||
                        controller.isEmailValid.value) {
                      // Nếu email rỗng hoặc hợp lệ, không hiển thị văn bản lỗi
                      return const SizedBox();
                    } else {
                      // Nếu email không rỗng và không hợp lệ, hiển thị văn bản lỗi
                      return Column(
                        children: [
                          SizedBox(width: 0.0, height: 10.h),
                          Text(
                            Strings.malformedEmail,
                            style: AppTextStyle.bodySmallStyle
                                .copyWith(color: Colors.red, fontSize: 12.sp),
                          ),
                        ],
                      );
                    }
                  },
                ),
                Obx(() {
                  if (controller.isEmailExists.value == true) {
                    return Text(
                      Strings.notEmail,
                      style: AppTextStyle.bodySmallStyle
                          .copyWith(color: Colors.red, fontSize: 12.sp),
                    );
                  } else {
                    return const SizedBox(width: 0.0, height: 0.0);
                  }
                })
              ],
            ),
            Stack(
              children: [
                Center(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      if (controller.checkTextControllersNotEmpty() == true) {
                      } else {
                        String email =
                            controller.textEmailController.value.text;
                        controller.getrequestEmail(email);
                      }
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
