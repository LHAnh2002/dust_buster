import 'dart:convert';

import '../exports.dart';

class SlideService {
  Future<List<SlideModel>> getBannersFromJson() async {
    // Dữ liệu JSON đã cung cấp
    final jsonString = '''
    [
      {
        "id": "1",
        "image": "https://firebasestorage.googleapis.com/v0/b/dustbuster-d9b9f.appspot.com/o/slide1.jpeg?alt=media&token=3e42f784-eb72-416b-9e2f-aa7b537387f8",
        "link": "https://pub.dev/packages/url_launcher"
      },
      {
        "id": "2",
        "image": "https://firebasestorage.googleapis.com/v0/b/dustbuster-d9b9f.appspot.com/o/slide2.jpeg?alt=media&token=39c1f74f-fe71-4c2a-b7e6-227be026064f",
        "link": "https://www.youtube.com"
      },
      {
        "id": "3",
        "image": "https://firebasestorage.googleapis.com/v0/b/dustbuster-d9b9f.appspot.com/o/slide4.jpeg?alt=media&token=5d6d99fe-b6b3-4953-b0d5-8f4c6a6c6564",
        "link": "https://www.facebook.com"
      }
    ]
    ''';

    // Phân tích cú pháp JSON và tạo danh sách BannerModel
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => SlideModel.fromJson(json)).toList();
  }
}
