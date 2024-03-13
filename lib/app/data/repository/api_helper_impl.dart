import 'package:dust_buster/app/common/constants.dart';
import 'package:dust_buster/app/common/storage/storage.dart';
import 'package:dust_buster/app/data/repository/api_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiHelperImpl implements ApiHelper {
  String apiUrl = Constants.baseUrl;
  String baseVietMapUrl = Constants.baseVietMapUrl;
  String apiKeyVietMap = Constants.apiKeyVietMap;

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
  Future<Map<String, dynamic>> referralCode({required String code}) async {
    final url = '$apiUrl/referral-code/';

    final response = await http.post(Uri.parse(url),
        body: jsonEncode({
          "referralCode": code,
        }),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200 || response.statusCode == 404) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Không có mã giới thiệu này');
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
  Future<Map<String, dynamic>> portCreateUsers({
    required String password,
    required String phoneNumber,
    required String email,
    required String name,
    required int sex,
    required String datebirth,
    required String referralCode,
  }) async {
    final url = '$apiUrl/create-users/';
    final response = await http.post(Uri.parse(url),
        body: jsonEncode({
          "password": password,
          "phoneNumber": phoneNumber,
          "email": email,
          "name": name,
          "sex": sex,
          "datebirth": datebirth,
          "referralCode": referralCode,
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
    final url = '$apiUrl/verify-otp/';

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

  //quên mật khẩu
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

// gợi ý tìm kiếm địa chi nhanh
  @override
  Future<List<Map<String, dynamic>>> vietMapAutoComplete(
      {required String location}) async {
    final url =
        '$baseVietMapUrl/autocomplete/v3?apikey=$apiKeyVietMap&text=$location';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return List<Map<String, dynamic>>.from(
          jsonResponse); // Return a list of maps
    } else {
      throw Exception('Error fetching autocomplete data from the server');
    }
  }

// gợi ý tìm kiếm địa chi nhanh
  @override
  Future<List<Map<String, dynamic>>> getPlaceVietMap(
      {required String refId}) async {
    final url = '$baseVietMapUrl/place/v3?apikey=$apiKeyVietMap&refid=$refId';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return [jsonResponse];
    } else {
      throw Exception('Lỗi tìm nạp dữ liệu tự động hoàn thành từ máy chủ');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getReverseVietMap(
      {required String lat, required String lng}) async {
    final url =
        '$baseVietMapUrl/reverse/v3?apikey=$apiKeyVietMap&lng=$lng&lat=$lat';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return List<Map<String, dynamic>>.from(jsonResponse);
    } else {
      throw Exception('Lỗi tìm nạp dữ liệu tự động hoàn thành từ máy chủ');
    }
  }

//xác minh đăng nhập
  @override
  Future<Map<String, dynamic>> postVerifyToken({required String token}) async {
    final url = '$apiUrl/verify-token/';

    final response = await http.post(
      Uri.parse(url),
      headers: getHeaders(token),
    );
    // final jsonResponse = json.decode(response.body);
    // debugPrint("json $jsonResponse");
    if (response.statusCode == 200 || response.statusCode == 401) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Email không tồn tại');
    }
  }

  //tạo tạo dữ liệu
  @override
  Future<Map<String, dynamic>> postCreateLocation(
      {required String location,
      required String location2,
      required String lat,
      required String lng}) async {
    String? accessToken = Storage.getValue<String>('access_token');
    final url = '$apiUrl/create-location/';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        "location": location,
        "location2": location2,
        "lat": lat,
        "lng": lng,
      }),
      headers: getHeaders(accessToken!),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return jsonResponse;
    } else {
      throw Exception('Tạo Địa chỉ thất bại');
    }
  }

  @override
  Future<Map<String, dynamic>> getLocation() async {
    final url = '$apiUrl/get-location/';
    String? accessToken = Storage.getValue<String>('access_token');
    final response = await http.get(
      Uri.parse(url),
      headers: getHeaders(accessToken!),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return jsonResponse;
    } else {
      throw Exception('Lấy thông tin thất bại');
    }
  }

  @override
  Future<Map<String, dynamic>> delLocation(
      {required String id, required int defaultt}) async {
    final url = '$apiUrl/delete-location/';

    final response = await http.delete(Uri.parse(url),
        body: jsonEncode({
          "id": id,
          "defaultt": defaultt,
        }),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200 || response.statusCode == 400) {
      final jsonResponse = json.decode(response.body);

      return jsonResponse;
    } else {
      throw Exception('Xóa địa chỉ thất bại');
    }
  }

  @override
  Future<Map<String, dynamic>> putLocation(
      {required String id, required String idUsers}) async {
    final url = '$apiUrl/update-location/';

    final response = await http.put(Uri.parse(url),
        body: jsonEncode({
          "id": id,
          "id_users": idUsers,
        }),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return jsonResponse;
    } else {
      throw Exception('Sửa địa chỉ mặc định thất bại');
    }
  }
}
