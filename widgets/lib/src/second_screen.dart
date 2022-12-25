import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets/src/third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return ThirdScreen();
                },
              ));
            },
          )
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/560181.png',
            width: 300,
            height: 100,
            fit: BoxFit.contain,
          ),
          
        ],
      ),
    );
  }
}
