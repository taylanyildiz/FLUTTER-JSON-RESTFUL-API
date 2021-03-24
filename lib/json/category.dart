class Categories {
  final int category_id;
  final String category_name;
  Categories({this.category_id, this.category_name});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
        category_id: json["category_id"] as int,
        category_name: json["category_name"] as String);
  }
}
