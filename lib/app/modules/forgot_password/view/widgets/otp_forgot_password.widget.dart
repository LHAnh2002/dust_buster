import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../common/util/exports.dart';
import '../../../../routes/app_pages.dart';
import '../../../create_account/controllers/create_account_controller.dart';
import '../../../create_account/view/widgets/check_dk_pw_widget.dart';
import '../../../login/view/widgets/text_button_widget.dart';
import '../../../widgets/text_form_widget.dart';

class OtpForgotPasswordWidget extends StatelessWidget {
  final String email;
  final CreateAccountController controller;
  const OtpForgotPasswordWidget(
      {Key? key, required this.email, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.startCountdown();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          textAlign: TextAlign.center,
          Strings.insertCode + '$email',
          style: AppTextStyle.conditionStyle.copyWith(
            color: AppColors.black,
            fontSize: 13.5.sp,
          ),
        ),
        SizedBox(height: 50.0.h),
        Pinput(
          length: 6,
          defaultPinTheme: controller.defaultPinTheme,
          focusedPinTheme: controller.defaultPinTheme.copyWith(
            decoration: controller.defaultPinTheme.decoration!.copyWith(
              border: Border.all(color: AppColors.kButtonColor),
            ),
          ),
          onCompleted: (pin) {
            debugPrint(pin);
            Get.bottomSheet(
              // isScrollControlled: true,
              Container(
                padding: const EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 20)
                    .r,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.plsNewPassword,
                        style: AppTextStyle.semiBoldMediumStyle
                            .copyWith(color: Colors.black),
                      ),
                      SizedBox(width: 0.0, height: 20.h),
                      TextFormWidget(
                        controller: controller.textPasswordController,
                        hintText: Strings.newPassword,
                        textInputType: TextInputType.visiblePassword,
                        obscureText: controller.isPasswordVisible,
                        togglePasswordVisibility: () {
                          controller.togglePasswordVisibility();
                        },
                        showButton: true,
                        onChanged: (value) {
                          controller.checkPassWordFormat(value);
                          controller.checkPasswordsMatch(
                              value,
                              controller
                                  .textReEnterPasswordController.value.text);
                        },
                      ),
                      SizedBox(width: 0.0, height: 7.h),
                      Obx(() {
                        return CheckDkPwWidget(
                          text: Strings.characters,
                          color: controller.isCharacters.value
                              ? AppColors.kGreenChart
                              : AppColors
                                  .kGreyChart, // Sử dụng màu đỏ nếu không đáp ứng điều kiện
                        );
                      }),
                      SizedBox(width: 0.0, height: 5.h),
                      Obx(() {
                        return CheckDkPwWidget(
                          text: Strings.capitalLetter,
                          color: controller.isCapitalLetter.value
                              ? AppColors.kGreenChart
                              : AppColors
                                  .kGreyChart, // Sử dụng màu đỏ nếu không đáp ứng điều kiện
                        );
                      }),
                      SizedBox(width: 0.0, height: 5.h),
                      Obx(() {
                        return CheckDkPwWidget(
                          text: Strings.oneDigit,
                          color: controller.isOneDigit.value
                              ? AppColors.kGreenChart
                              : AppColors
                                  .kGreyChart, // Sử dụng màu đỏ nếu không đáp ứng điều kiện
                        );
                      }),
                      SizedBox(width: 0.0, height: 10.h),
                      TextFormWidget(
                        controller: controller.textReEnterPasswordController,
                        hintText: Strings.reEnterPassword,
                        textInputType: TextInputType.text,
                        obscureText: controller.isPasswordVisible,
                        togglePasswordVisibility: () {
                          controller.togglePasswordVisibility();
                        },
                        showButton: true,
                        onChanged: (value) {
                          controller.checkPasswordsMatch(
                              controller.textPasswordController.value.text,
                              value);
                        },
                      ),
                      SizedBox(width: 0.0, height: 5.h),
                      Obx(
                        () {
                          if (controller.isCheckGd.value == false) {
                            return Text(
                              Strings.notTheSame,
                              style: AppTextStyle.bodySmallStyle
                                  .copyWith(color: Colors.red, fontSize: 12.sp),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                      SizedBox(width: 0.0, height: 10.h),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          if (controller.checkTextPasswordNotEmpty() == true) {
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Đổi mật khẩu thành công',
                                    style: AppTextStyle.semiBoldMediumStyle
                                        .copyWith(color: AppColors.black),
                                  ),
                                  content: SizedBox(
                                    width: 200.w,
                                    height: 40.h,
                                    child: SingleChildScrollView(
                                      child: Text(
                                        "Vui lòng đăng nhập để sử dụng dịch vụ!",
                                        style: AppTextStyle.regularBlandStyle
                                            .copyWith(color: AppColors.black),
                                      ),
                                    ),
                                  ),
                                  actions: <Widget>[
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        Get.offNamed(Routes.login);
                                      },
                                      child: Text(
                                        Strings.login,
                                        style: AppTextStyle.semiBoldMediumStyle
                                            .copyWith(
                                                color: AppColors.kSelectedDay),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
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
                            Strings.confirm,
                            style: AppTextStyle.buttonTextStyle.copyWith(
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(height: 30.0.h),
        const Text('Bạn chưa nhận được mã!'),
        Obx(
          () {
            return controller.countdownValue.value == 0
                ? TextButtonWidget(
                    onTap: () {
                      controller.resetCountdown();
                    },
                    text: Strings.resendCode,
                  )
                : Text(
                    '${Strings.resendLater}: ${controller.formatDuration(controller.countdownValue.value)} s',
                  );
          },
        ),
      ],
    );
  }
}
