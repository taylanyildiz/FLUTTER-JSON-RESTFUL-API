import 'package:flutter_json_parse/json/category.dart';
import 'package:flutter_json_parse/json/director.dart';

class Films {
  final int film_id;
  final String film_name;
  final Categories category;
  final Directors director;
  Films({this.film_id, this.film_name, this.category, this.director});

  factory Films.fromJson(Map<String, dynamic> json) {
    return Films(
      film_id: json["film_id"] as int,
      film_name: json["film_name"] as String,
      category: Categories.fromJson(json["category"]),
      director: Directors.fromJson(json["director"]),
    );
  }
}
