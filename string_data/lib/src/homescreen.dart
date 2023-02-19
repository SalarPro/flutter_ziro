import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var keyWriteTVC = TextEditingController();
  var valueWriteTVC = TextEditingController();
  var keyReadTVC = TextEditingController();

  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("String Data"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          TextField(
            controller: keyWriteTVC,
            decoration: InputDecoration(hintText: "Value"),
          ),
          TextField(
            controller: valueWriteTVC,
            decoration: InputDecoration(hintText: "Key"),
          ),
          ElevatedButton(
              onPressed: () {
                // saveToSharedPref(keyWriteTVC.text, valueWriteTVC.text);
                test();
              },
              child: Text('Write')),
          TextField(
            controller: keyReadTVC,
            decoration: InputDecoration(hintText: "Key"),
          ),
          Text(result),
          ElevatedButton(
              onPressed: () {
                // readFromSharedPref(keyReadTVC.text);
                test2();
              },
              child: Text('Read'))
        ],
      )),
    );
  }

  void saveToSharedPref(String key, String value) async {
    var shared = await SharedPreferences.getInstance();

    shared.setString(key, value);
  }

  readFromSharedPref(String key) async {
    var shared = await SharedPreferences.getInstance();

    var value = shared.getString(key) ?? "NO Value";

    setState(() {
      result = value;
    });
  }

  test() {
    var jsonString = '{"name":"John", "age":30, "car":true}';
    //                {"name":"John", "age":25, "car":false}

    var name = "";
    var age = 0;
    var car = false;

    var json = jsonDecode(jsonString);
    var map = json as Map<String, dynamic>;

    name = map["name"];
    age = map["age"];
    car = map["car"];

    print(name);
    print(age);
    print(car);
  }

  test2() {
    var name = "Newar";
    var age = 25;
    var car = false;

    Map<String, dynamic> map = {"name": name, "age": age, "car": car};

    var json = jsonEncode(map);

    print(json);
  }
}
