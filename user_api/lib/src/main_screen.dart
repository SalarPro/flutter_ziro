import 'dart:convert';

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
    // TODO: implement initState
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
            child: Image.network(
              user.imageURL!,
              width: 100,
              height: 100,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                user.name!.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text("@${user.userName!}", style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(user.userName!),
                    SizedBox(width: 10),
                    Icon(Icons.call),
                  ],
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

    var jsonString = json.decode(mData.body) as List<dynamic>;

    jsonString.forEach((element) {
      var user = UserModel.fromMap(element);
      users.add(user);
    });
    if (mounted) setState(() {});
  }
}
