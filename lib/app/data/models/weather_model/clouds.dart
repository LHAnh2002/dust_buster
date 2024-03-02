import 'package:dust_buster/app/common/util/model_util.dart';

class Clouds {
  double? all;

  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: toDouble(json['all']),
      );

  Map<String, dynamic> toJson() => {
        'all': all,
      };
}
