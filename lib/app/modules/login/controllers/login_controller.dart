import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/routes/app_pages.dart';

import '../../../data/models/dust_buster_model/login_model.dart';
import '../../../data/repository/api_helper.dart';

class LoginController extends GetxController with StateMixin<LoginModel> {
  final ApiHelper _apiHelper = Get.find();

  final TextEditingController textEmailController = TextEditingController();
  final TextEditingController textPasswordController = TextEditingController();

  var isPasswordVisible = true.obs;
  var ispasswordOrEmailNull = false.obs;
  var isPasswordOrEmailIncorrect = false.obs;
  var isyourAccountBan = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  @override
  void onClose() {
    textEmailController.dispose();
    textPasswordController.dispose();
    super.onClose();
  }

  login() async {
    change(null, status: RxStatus.loading());
    final String email = textEmailController.text;
    final String passWord = textPasswordController.text;
    if (email.trim().isEmpty || passWord.trim().isEmpty) {
      isPasswordOrEmailIncorrect.value = false;
      isyourAccountBan.value = false;
      ispasswordOrEmailNull.value = true;
      return; // Trả về ngay khi email hoặc password rỗng
    }

    change(null, status: RxStatus.loading());
    try {
      final response =
          await _apiHelper.portLogin(email: email, password: passWord);
      final detail = response['detail'];
      if (detail == -1 || detail == -2) {
        isPasswordOrEmailIncorrect.value = true;
        isyourAccountBan.value = false;
        ispasswordOrEmailNull.value = false;
        return;
      } else if (detail == -3) {
        isPasswordOrEmailIncorrect.value = false;
        isyourAccountBan.value = true;
        ispasswordOrEmailNull.value = false;
        return;
      } else {
        final token = response['access_token'] as String;
        await Storage.saveValue('access_token', token);
        LoginModel loginModel = LoginModel.fromJson(response);
        change(loginModel, status: RxStatus.success());
        // String? accessToken = response['access_token'] as String?;
        // print(accessToken);
        Get.offAndToNamed(Routes.navigationBar);
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
