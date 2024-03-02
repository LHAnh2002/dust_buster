import 'package:dust_buster/app/common/util/model_util.dart';

class Sys {
  int? type;
  int? id;
  String? country;
  double? sunrise;
  double? sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json['type'] as int?,
        id: json['id'] as int?,
        country: json['country'] as String?,
        sunrise: toDouble(json['sunrise']),
        sunset: toDouble(json['sunset']),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'id': id,
        'country': country,
        'sunrise': sunrise,
        'sunset': sunset,
      };
}
