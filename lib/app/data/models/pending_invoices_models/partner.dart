class Partner {
  String? idP;
  String? imageP;
  String? nameP;

  Partner({this.idP, this.imageP, this.nameP});

  Partner.fromJson(Map<String, dynamic> json) {
    idP = json['idP'];
    imageP = json['imageP'];
    nameP = json['nameP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idP'] = this.idP;
    data['imageP'] = this.imageP;
    data['nameP'] = this.nameP;
    return data;
  }
}
