import 'package:get/get.dart';

abstract class ApiHelper {
  Future<Response> getWeather({required String cityName});
}
