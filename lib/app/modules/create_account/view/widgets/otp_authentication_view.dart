import 'package:dust_buster/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../common/util/exports.dart';
import '../../../login/exports.dart';
import '../../exports.dart';

class OtpAuthenticationView extends StatelessWidget {
  final String email;
  final CreateAccountController controller;
  const OtpAuthenticationView(
      {super.key, required this.email, required this.controller});

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
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    'Đăng ký thành công',
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
                            .copyWith(color: AppColors.kSelectedDay),
                      ),
                    )
                  ],
                );
              },
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
