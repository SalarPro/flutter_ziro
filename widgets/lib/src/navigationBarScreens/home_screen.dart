import 'package:flutter/material.dart';

class Home2Screen extends StatelessWidget {
  const Home2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Name"),
      ),
      body: Container(
        child: Image.asset(
          'assets/images/ztech.png',
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
