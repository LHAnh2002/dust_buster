import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/util/exports.dart';
import '../../login/exports.dart';
import '../exports.dart';

class CreateAccountView extends GetView<CreateAccountController> {
  const CreateAccountView({Key? key}) : super(key: key);

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
          Strings.createAccount,
          style: AppTextStyle.text24BoldStyle
              .copyWith(fontSize: 20.sp, color: AppColors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(bottom: 40, left: 15, right: 15, top: 10).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.showImagePicker(context);
                    },
                    child: Obx(() {
                      return CircleAvatar(
                        radius: 70,
                        backgroundImage: controller.imageFile.value != null
                            ? FileImage(controller.imageFile.value!)
                            : null,
                        child: controller.imageFile.value == null
                            ? const Icon(Icons.camera_alt, size: 50)
                            : null,
                      );
                    }),
                  ),
                  SizedBox(width: 0.0, height: 20.h),
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
                ],
              ),
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
                          Strings.passwordOrEmailIncorrect,
                          style: AppTextStyle.bodySmallStyle
                              .copyWith(color: Colors.red, fontSize: 12.sp),
                        ),
                      ],
                    );
                  }
                },
              ),
              SizedBox(width: 0.0, height: 10.h),
              TextFormWidget(
                controller: controller.textphoneNumberController,
                hintText: Strings.phoneNumber,
                textInputType: TextInputType.number,
                obscureText: false.obs,
                togglePasswordVisibility: () {},
                showButton: false,
                onChanged: (value) {
                  controller.checkPhoneNumberFormat(value);
                },
              ),
              Obx(
                () {
                  if (controller.isSdtNull.value ||
                      controller.isSdtValid.value) {
                    return const SizedBox();
                  } else {
                    return Column(
                      children: [
                        SizedBox(width: 0.0, height: 10.h),
                        Text(
                          Strings.phoneNumberIncorrect,
                          style: AppTextStyle.bodySmallStyle
                              .copyWith(color: Colors.red, fontSize: 12.sp),
                        ),
                      ],
                    );
                  }
                },
              ),
              SizedBox(width: 0.0, height: 10.h),
              TextFormWidget(
                controller: controller.textNameController,
                hintText: Strings.username,
                textInputType: TextInputType.text,
                obscureText: false.obs,
                togglePasswordVisibility: () {},
                showButton: false,
                onChanged: (value) {},
              ),
              SizedBox(width: 0.0, height: 10.h),
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.sex,
                        style: AppTextStyle.conditionStyle
                            .copyWith(color: AppColors.black),
                      ),
                      Stack(
                        children: [
                          Center(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Get.bottomSheet(
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                      ),
                                    ),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.options.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(
                                            controller.options[index],
                                            style: AppTextStyle.bodyStyle
                                                .copyWith(
                                                    color: AppColors.black,
                                                    fontSize: 15.sp),
                                          ),
                                          onTap: () {
                                            controller.selectedOption.value =
                                                controller.options[index];
                                            controller.textSexPasswordController
                                                    .text =
                                                controller.options[index];
                                            Get.back();
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 45.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black.withOpacity(0.1),
                                      blurRadius: 7.r,
                                    ),
                                  ],
                                ),
                                child: Obx(
                                  () => Center(
                                    child: Text(
                                      controller.selectedOption.value,
                                      style: AppTextStyle.bodyStyle.copyWith(
                                          color: AppColors.black,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 10.w, height: 0),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.dateOfBirth,
                          style: AppTextStyle.conditionStyle
                              .copyWith(color: AppColors.black),
                        ),
                        Container(
                          height: 45.h,
                          padding: const EdgeInsets.only(left: 10, right: 10).r,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.1),
                                blurRadius: 7.r,
                              ),
                            ],
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              controller.selectDate(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Obx(
                                  () => Text(
                                    '${controller.selectedDate.value.day}/${controller.selectedDate.value.month}/${controller.selectedDate.value.year}',
                                    style: AppTextStyle.bodyStyle.copyWith(
                                      color: AppColors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                const Icon(Icons.calendar_today),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(width: 0.0, height: 10.h),
              TextFormWidget(
                controller: controller.textPasswordController,
                hintText: Strings.password,
                textInputType: TextInputType.visiblePassword,
                obscureText: controller.isPasswordVisible,
                togglePasswordVisibility: () {
                  controller.togglePasswordVisibility();
                },
                showButton: true,
                onChanged: (value) {
                  controller.checkPassWordFormat(value);
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
                      controller.textPasswordController.value.text, value);
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
              Stack(
                children: [
                  Center(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        controller.setTextControllerDefaultIfEmpty(
                            controller.textSexPasswordController, 'Khác');
                        DateTime now = DateTime.now();
                        // Định dạng ngày tháng theo dạng mong muốn, ví dụ: 'dd/MM/yyyy'
                        String formattedDate =
                            DateFormat('dd/MM/yyyy').format(now);
                        controller.setTextControllerDefaultIfEmpty(
                            controller.textdateOfBirthPasswordController,
                            formattedDate);
                        if (controller.checkTextControllersNotEmpty() == true) {
                        } else {
                          String email =
                              controller.textEmailController.value.text;
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
                              child: OtpAuthenticationView(
                                email: email,
                                controller: CreateAccountController(),
                              ),
                            ),
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
      ),
    );
  }
}
