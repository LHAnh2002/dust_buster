class Constants {
  const Constants._();

  //static const String baseUrl = ' http://127.0.0.1:8000/api/v1';
  static const String baseUrl = 'http://192.168.1.8:8000/api/v1';
  // static const String baseUrl = 'http://10.38.29.246:8000/api/v1';
  static const String baseVietMapUrl = 'https://maps.vietmap.vn/api';
  //deelay.me - api to delay response

  static const timeout = Duration(milliseconds: 30000);
  static const String apiKeyVietMap =
      '506862bb03a3d71632bdeb7674a3625328cb7e5a9b011841';
  static const String token = 'authToken';
  static const String tokenSocket = 'tokenSocket';
}
