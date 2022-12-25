import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isActive = false;
  bool isActive1 = false;
  bool isActive2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Setting"),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: "Name",
                  label: Icon(
                    Icons.edit,
                    color: Colors.redAccent,
                  ),
                  hintText: "Ex: Newar Najim"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    // labelText: "Name",
                    label: Icon(
                      Icons.search,
                      color: Colors.redAccent,
                    ),
                    hintText: "Ex: Newar Najim")),
            getCheckBoxWidget(isActive, "Receive Notifications", (value) {
              setState(() {
                isActive = value ?? false;
              });
            }),
            getCheckBoxWidget(isActive1, "Receive Notifications", (value) {
              setState(() {
                isActive1 = value ?? false;
              });
            }),
            getCheckBoxWidget(isActive2, "Receive Notifications", (value) {
              setState(() {
                isActive2 = value ?? false;
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget getCheckBoxWidget(bool value, String text, onClick) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(value: value, onChanged: onClick),
        Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
