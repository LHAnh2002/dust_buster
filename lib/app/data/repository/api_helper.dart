abstract class ApiHelper {
  Future<Map<String, dynamic>> portLogin(
      {required String email, required String password});

  Future<Map<String, dynamic>> portCreateUsers(
      {required String password,
      required String phoneNumber,
      required String email,
      required String name,
      required int sex,
      required String datebirth});

  Future<Map<String, dynamic>> requestOtp(
      {required String email, required String name});

  Future<Map<String, dynamic>> verifyOtp(
      {required String email, required String otp});

  Future<Map<String, dynamic>> requestEmail({required String email});

  Future<Map<String, dynamic>> forgotPassword(
      {required String email, required String newPassword});
  Future<Map<String, dynamic>> verifyToken({required String accessToken});
  Future<Map<String, dynamic>> logout({required String accessToken});
}
