import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome User"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: Text("Profile"),
      ),
    );
  }
}
