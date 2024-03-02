import 'package:dust_buster/app/common/util/model_util.dart';

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  double? pressure;
  double? humidity;
  double? seaLevel;
  double? grndLevel;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: toDouble(json['temp']),
        feelsLike: toDouble(json['feels_like']),
        tempMin: toDouble(json['temp_min']),
        tempMax: toDouble(json['temp_max']),
        pressure: toDouble(json['pressure']),
        humidity: toDouble(json['humidity']),
        seaLevel: toDouble(json['sea_level']),
        grndLevel: toDouble(json['grnd_level']),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'pressure': pressure,
        'humidity': humidity,
        'sea_level': seaLevel,
        'grnd_level': grndLevel,
      };
}
