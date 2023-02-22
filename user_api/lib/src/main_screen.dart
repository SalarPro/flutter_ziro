import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_api/src/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return cell(users[index]);
        },
      ),
    );
  }

  Widget cell(UserModel user) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue[900],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CachedNetworkImage(
              imageUrl: user.imageURL!,
              placeholder: (context, url) {
                return FlutterLogo();
              },
              width: 100,
              height: 100,
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                (user.name ?? "").toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text("@${user.userName ?? ""}",
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  print("touched");
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Text(user.phone ?? ""),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.phone),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  getUsers() async {
    var mData = await http.get(Uri.parse("https://api.github.com/users"));

    var body = mData.body;

    var jsonData = json.decode(body);
    var jsonList = jsonData as List<dynamic>;

    jsonList.forEach((element) {
      var user = UserModel.fromMap(element);
      users.add(user);
    });
    if (mounted) setState(() {});
  }
}
