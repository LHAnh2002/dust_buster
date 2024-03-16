abstract class ApiHelper {
  Future<Map<String, dynamic>> portLogin(
      {required String email, required String password});

  Future<Map<String, dynamic>> portCreateUsers({
    required String password,
    required String phoneNumber,
    required String email,
    required String name,
    required int sex,
    required String datebirth,
    required String referralCode,
  });

  Future<Map<String, dynamic>> requestOtp(
      {required String email, required String name});

  Future<Map<String, dynamic>> verifyOtp(
      {required String email, required String otp});

  Future<Map<String, dynamic>> requestEmail({required String email});

  Future<Map<String, dynamic>> forgotPassword(
      {required String email, required String newPassword});

  Future<Map<String, dynamic>> logout({required String accessToken});

  Future<Map<String, dynamic>> referralCode({required String code});

  Future<List<Map<String, dynamic>>> vietMapAutoComplete(
      {required String location});

  Future<List<Map<String, dynamic>>> getPlaceVietMap({required String refId});

  Future<List<Map<String, dynamic>>> getReverseVietMap(
      {required String lat, required String lng});

  Future<Map<String, dynamic>> getLocation();

  Future<Map<String, dynamic>> delLocation(
      {required String id, required int defaultt});
  Future<Map<String, dynamic>> putLocation(
      {required String id, required String idUsers});

  Future<Map<String, dynamic>> postVerifyToken({required String token});

  Future<Map<String, dynamic>> getHomePage();

  Future<Map<String, dynamic>> getCustomerPromotions({required String id});

  Future<Map<String, dynamic>> postCheckPromotions({required String id});

  Future<Map<String, dynamic>> postCreateLocation(
      {required String location,
      required String location2,
      required String lat,
      required String lng});
}
