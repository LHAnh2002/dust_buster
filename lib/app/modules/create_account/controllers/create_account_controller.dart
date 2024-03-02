import 'dart:async';
import 'dart:io';

import 'package:dust_buster/app/common/util/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pinput/pinput.dart';

class CreateAccountController extends GetxController {
  final TextEditingController textEmailController = TextEditingController();
  final TextEditingController textphoneNumberController =
      TextEditingController();
  final TextEditingController textNameController = TextEditingController();
  final TextEditingController textPasswordController = TextEditingController();
  final TextEditingController textReEnterPasswordController =
      TextEditingController();
  final TextEditingController textSexPasswordController =
      TextEditingController();
  final TextEditingController textdateOfBirthPasswordController =
      TextEditingController();

  Rx<File?> imageFile = Rx<File?>(null);

  var isEmailValid = false.obs;
  var isEmailNull = true.obs;
  var isSdtValid = false.obs;
  var isSdtNull = true.obs;
  var isPasswordVisible = true.obs;

  var isCharacters = false.obs;
  var isCapitalLetter = false.obs;
  var isOneDigit = false.obs;
  var isCheckGd = true.obs;

  final selectedDate = DateTime.now().obs;

  final List<String> options = ['Khác', 'Nam', 'Nữ'];
  final RxString selectedOption = RxString('Khác');

  var countdownValue = 60.obs;
  late Timer _timer;

  final ImagePicker _picker = ImagePicker();

  bool checkTextControllersNotEmpty() {
    bool isAnyEmpty = false;
    isAnyEmpty =
        isAnyEmpty || checkControllerNotEmpty(textEmailController, 'Email');
    isAnyEmpty = isAnyEmpty ||
        checkControllerNotEmpty(textphoneNumberController, 'Phone number');
    isAnyEmpty =
        isAnyEmpty || checkControllerNotEmpty(textNameController, 'Name');
    isAnyEmpty = isAnyEmpty ||
        checkControllerNotEmpty(textPasswordController, 'Password');
    isAnyEmpty = isAnyEmpty ||
        checkControllerNotEmpty(
            textReEnterPasswordController, 'Re-enter Password');
    isAnyEmpty =
        isAnyEmpty || checkControllerNotEmpty(textSexPasswordController, 'Sex');
    isAnyEmpty = isAnyEmpty ||
        checkControllerNotEmpty(
            textdateOfBirthPasswordController, 'Date of Birth');

    // Thêm điều kiện kiểm tra các biến khác
    isAnyEmpty = isAnyEmpty || !isEmailValid.value;
    isAnyEmpty = isAnyEmpty || isEmailNull.value;
    // Thêm các điều kiện khác tương tự ở đây

    return isAnyEmpty;
  }

  bool checkTextPasswordNotEmpty() {
    bool isAnyEmpty = false;
    isAnyEmpty = isAnyEmpty ||
        checkControllerNotEmpty(textPasswordController, 'Password');
    isAnyEmpty = isAnyEmpty ||
        checkControllerNotEmpty(
            textReEnterPasswordController, 'Re-enter Password');
    isAnyEmpty = isAnyEmpty || isCapitalLetter.value;
    isAnyEmpty = isAnyEmpty || !isCharacters.value;
    isAnyEmpty = isAnyEmpty || isCapitalLetter.value;
    isAnyEmpty = isAnyEmpty || isOneDigit.value;
    if (textPasswordController.value.text ==
        textReEnterPasswordController.value.text) {
      isAnyEmpty = false;
    }
    return isAnyEmpty;
  }

  bool checkControllerNotEmpty(
      TextEditingController controller, String fieldName) {
    bool isEmpty = controller.text.isEmpty;
    if (!isEmpty) {
      print('$fieldName is empty');
    } else {
      print('$fieldName is not empty');
    }
    return isEmpty;
  }

  void setTextControllerDefaultIfEmpty(
      TextEditingController controller, String defaultValue) {
    if (controller.text.isEmpty) {
      controller.text = defaultValue;
    }
  }

  void checkEmailFormat(String email) {
    if (email.isEmpty) {
      isEmailNull.value = true;
      isEmailValid.value = false;
      return;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    isEmailValid.value = emailRegex.hasMatch(email);
    isEmailNull.value = false;
  }

  void checkPhoneNumberFormat(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      isSdtNull.value = true;
      isSdtValid.value = false;
      return;
    }

    final phoneNumberRegex = RegExp(r'^[0-9]{10}$');

    isSdtValid.value = phoneNumberRegex.hasMatch(phoneNumber);
    isSdtNull.value = false;
  }

  void checkPassWordFormat(String password) {
    isCharacters.value = password.length >= 8;

    isCapitalLetter.value = password.contains(RegExp(r'[A-Z]'));

    isOneDigit.value = password.contains(RegExp(r'[0-9]'));
  }

  void checkPasswordsMatch(String password1, String password2) {
    if (password2.isEmpty) {
      isCheckGd.value = true;
      return;
    }
    if (password1 != password2) {
      isCheckGd.value = false;
      return;
    }
    // So sánh hai chuỗi mật khẩu với nhau
    if (password1 == password2) {
      isCheckGd.value = true;
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  @override
  void onClose() {
    textEmailController.dispose();
    textPasswordController.dispose();
    super.onClose();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      textdateOfBirthPasswordController.text =
          '${picked.day}/${picked.month}/${picked.year}';
    }
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Chọn từ thư viện'),
                onTap: () {
                  pickImage(ImageSource.gallery);
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Chụp ảnh mới'),
                onTap: () {
                  pickImage(ImageSource.camera);
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  final defaultPinTheme = PinTheme(
    width: 45.w,
    height: 45.h,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Colors.black,
    ),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppColors.black),
    ),
  );

  void startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdownValue.value > 0) {
        countdownValue.value -= 1;
      } else {
        _timer.cancel();
      }
    });
  }

  void resetCountdown() {
    countdownValue.value = 60;
    startCountdown();
  }

  String formatDuration(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
