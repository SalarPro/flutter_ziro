import 'package:flutter/material.dart';
import 'package:widgets/src/navigationBarScreens/profile_screen.dart';
import 'package:widgets/src/navigationBarScreens/setting_screen.dart';
import 'package:widgets/src/second_screen.dart';

import 'navigationBarScreens/home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
        onTap: (cIndex) {
          setState(() {
            _currentIndex = cIndex;
          });
        },
        currentIndex: _currentIndex,
      ),
      body: _currentIndex == 0
          ? ProfileScreen()
          : _currentIndex == 1
              ? Home2Screen()
              : _currentIndex == 2
                  ? SettingScreen()
                  : Text("Nothing is Selected"),
    );
  }
}
