class Directors {
  final int director_id;
  final String director_name;
  Directors({this.director_id, this.director_name});

  factory Directors.fromJson(Map<String, dynamic> json) {
    return Directors(
        director_id: json["director_id"] as int,
        director_name: json["director_name"] as String);
  }
}
