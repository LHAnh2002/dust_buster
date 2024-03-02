class SlideModel {
  final String id;
  final String image;
  final String link;

  SlideModel({
    required this.id,
    required this.image,
    required this.link,
  });

  SlideModel.fromJson(Map<String, Object?> json)
      : this(
          id: json['id']! as String,
          image: json['image']! as String,
          link: json['link']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'image': image,
      'link': link,
    };
  }
}
