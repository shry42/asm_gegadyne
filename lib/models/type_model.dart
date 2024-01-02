class typeModel {
  int? id;
  String? type;

  typeModel({this.id, this.type});

  factory typeModel.fromJson(Map<String, dynamic> json) {
    return typeModel(
      id: json['id'] as int?,
      type: json['type'] as String?,
    );
  }
}
