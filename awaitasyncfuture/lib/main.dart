import 'package:awaitasyncfuture/homescreen.dart';
import 'package:awaitasyncfuture/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
    ),
    home: SplashScreen(),
  ));
}
