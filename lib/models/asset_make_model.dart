class AssetMake {
  int? id;
  String? make;

  AssetMake({this.id, this.make});

  factory AssetMake.fromJson(Map<String, dynamic> json) {
    return AssetMake(
      id: json['id'] as int?,
      make: json['make'] as String?,
    );
  }
}
