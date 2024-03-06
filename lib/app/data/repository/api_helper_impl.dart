import 'package:dust_buster/app/common/constants.dart';
import 'package:dust_buster/app/data/repository/api_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiHelperImpl implements ApiHelper {
  String apiUrl = Constants.baseUrl;

  Map<String, String> getHeaders(String accessToken) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
  }

  // đăng nhâp
  @override
  Future<Map<String, dynamic>> portLogin(
      {required String email, required String password}) async {
    final url = '$apiUrl/login-user/';
    final response = await http.post(Uri.parse(url),
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200 || response.statusCode == 401) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Đăng nhập thất bại');
    }
  }

  @override
  Future<Map<String, dynamic>> verifyToken(
      {required String accessToken}) async {
    final url = '$apiUrl/verify-token/';

    final response = await http.post(
      Uri.parse(url),
      headers: getHeaders(accessToken),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Chưa đăng nhập');
    }
  }

  @override
  Future<Map<String, dynamic>> logout({required String accessToken}) async {
    final url = '$apiUrl/logout/';

    final response = await http.post(
      Uri.parse(url),
      headers: getHeaders(accessToken),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return jsonResponse;
    } else {
      throw Exception('Đăng xuất thất bại');
    }
  }

  //tạo tài khoản
  @override
  Future<Map<String, dynamic>> portCreateUsers(
      {required String password,
      required String phoneNumber,
      required String email,
      required String name,
      required int sex,
      required String datebirth}) async {
    final url = '$apiUrl/create-users/';
    final response = await http.post(Uri.parse(url),
        body: jsonEncode({
          "password": password,
          "phoneNumber": phoneNumber,
          "email": email,
          "name": name,
          "sex": sex,
          "datebirth": datebirth
        }),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return jsonResponse;
    } else {
      throw Exception('Tạo tài khoản thất bại');
    }
  }

  //yêu cầu mã otp
  @override
  Future<Map<String, dynamic>> requestOtp(
      {required String email, required String name}) async {
    final url = '$apiUrl/request-otp-user/';

    final response = await http.post(Uri.parse(url),
        body: jsonEncode({
          "email": email,
          "name": name,
        }),
        headers: {
          'Content-Type': 'application/json',
        });
    // final jsonResponse = json.decode(response.body);
    // debugPrint("json $jsonResponse");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return jsonResponse;
    } else {
      throw Exception('Nhận mã OTP thất bại');
    }
  }

  // xác thực otp
  @override
  Future<Map<String, dynamic>> verifyOtp(
      {required String email, required String otp}) async {
    final url = '$apiUrl/request-email/';

    final response = await http.post(Uri.parse(url),
        body: jsonEncode({
          "email": email,
          "otp": otp,
        }),
        headers: {
          'Content-Type': 'application/json',
        });
    // final jsonResponse = json.decode(response.body);
    // debugPrint("json $jsonResponse");
    if (response.statusCode == 200 || response.statusCode == 400) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Xác minh OTP thất bại');
    }
  }

  // xác thực email
  @override
  Future<Map<String, dynamic>> requestEmail({required String email}) async {
    final url = '$apiUrl/request-email/';

    final response = await http.post(Uri.parse(url),
        body: jsonEncode({
          "email": email,
        }),
        headers: {
          'Content-Type': 'application/json',
        });
    // final jsonResponse = json.decode(response.body);
    // debugPrint("json $jsonResponse");
    if (response.statusCode == 200 || response.statusCode == 404) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Email không tồn tại');
    }
  }

  // quên mật khẩu
  @override
  Future<Map<String, dynamic>> forgotPassword(
      {required String email, required String newPassword}) async {
    final url = '$apiUrl/forgot-password/';

    final response = await http.put(Uri.parse(url),
        body: jsonEncode({
          "email": email,
          "newPassword": newPassword,
        }),
        headers: {
          'Content-Type': 'application/json',
        });
    // final jsonResponse = json.decode(response.body);
    // debugPrint("json $jsonResponse");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Đổi mật khẩu không thành công');
    }
  }
}
