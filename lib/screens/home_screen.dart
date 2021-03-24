import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_json_parse/json/complex_data.dart';
import 'package:flutter_json_parse/json/complex_film.dart';
import 'package:flutter_json_parse/json/film.dart';
import 'package:flutter_json_parse/json/json.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Users>> userConnect() async {
    String data =
        '{ "success" : 1, "users" : [ {"user_id":1,"user_name":"Taylan"},{"user_id":2,"user_name":"Mazlum"},{"user_id":3,"user_name":"Sible"},{"user_id":4,"user_name":"Zülfü"}] }';
    var jsonData = await json.decode(data);
    var complexData = ComplexData.fromJson(jsonData);
    List<Users> users = complexData.usersList;
    var success = complexData.success;
    print("success : $success");
    for (Users u in users) {
      print("**********");
      print("user id : ${u.user_id}");
      print("user name : ${u.user_name}");
    }
    return users;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allMovies();
  }

  Future allMovies() async {
    String movie =
        '{ "succes" : 1, "films" :[ { "film_id" : 1, "film_name": "Interstellar", "category":{ "category_id" : 1, "category_name" : "Science fiction" },"director":{ "director_id" : 1,"director_name":"Christopher Nola"} } ] }';
    var jsonData = json.decode(movie);

    ComplexFilm complexFilm = ComplexFilm.fromJson(jsonData);

    List<Films> films = complexFilm.filmList;
    int success = complexFilm.success;

    for (Films f in films) {
      print("**********");
      print("film id = ${f.film_id}");
      print("film name = ${f.film_name}");
      print("film category name = ${f.category.category_name}");
      print("film director name = ${f.director.director_name}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200.0,
              child: FutureBuilder<List<Users>>(
                future: userConnect(),
                builder: (context, _data) {
                  if (_data.hasData) {
                    var user = _data.data;
                    return ListView.builder(
                      itemCount: user.length,
                      itemBuilder: (context, index) {
                        return Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${user[index].user_id}-)",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "${user[index].user_name}",
                              style: TextStyle(fontSize: 20.0),
                            )
                          ],
                        ));
                      },
                    );
                  } else {
                    return Text("loading");
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
