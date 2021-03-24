import 'package:flutter_json_parse/json/film.dart';

class ComplexFilm {
  final int success;
  final List<Films> filmList;

  ComplexFilm({this.success, this.filmList});

  factory ComplexFilm.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["films"] as List;
    List<Films> fList = jsonArray.map((e) => Films.fromJson(e)).toList();

    return ComplexFilm(success: json["success"] as int, filmList: fList);
  }
}
