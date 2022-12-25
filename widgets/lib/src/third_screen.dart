import 'package:flutter/material.dart';
import 'package:widgets/src/second_screen.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third"),
      ),
      body: Center(
        child: Text("Third Screen"),
      ),
    );
  }
}
