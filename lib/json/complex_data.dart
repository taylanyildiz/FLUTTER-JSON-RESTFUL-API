import 'package:flutter_json_parse/json/users.dart';

class ComplexData {
  final int success;
  final List<Users> usersList;
  ComplexData({
    this.success,
    this.usersList,
  });

  factory ComplexData.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["users"] as List;
    List<Users> uList = jsonArray.map((e) => Users.fromJson(e)).toList();

    return ComplexData(
      success: json["success"] as int,
      usersList: uList,
    );
  }
}
