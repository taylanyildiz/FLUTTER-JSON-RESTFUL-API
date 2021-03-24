class Users {
  final int user_id;
  final String user_name;
  Users({
    this.user_id,
    this.user_name,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        user_id: json["user_id"] as int,
        user_name: json["user_name"] as String);
  }
}
