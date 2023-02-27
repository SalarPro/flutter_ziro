import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _controller = TextEditingController();
  var textData = "";
  Color bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your name',
                    icon: Icon(Icons.person),
                    iconColor: Colors.teal,
                    fillColor: Colors.teal),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              // onPressed: () async {
              //   print("before");
              //   await getText().then((value) {
              //     setState(() {
              //       textData = value;
              //     });
              //   });
              //   print("after");
              // },
              child: const Text('Go to Second Screen'),
            ),
            SizedBox(height: 100.0),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              // onPressed: () async {
              //   print("before");
              //   await getText().then((value) {
              //     setState(() {
              //       textData = value;
              //     });
              //   });
              //   print("after");
              // },
              child: const Text('Go to Second Screen'),
            ),
            SizedBox(height: 100.0),
            Text(textData),
            FutureBuilder(
              future: getText(),
              builder: (context, snapshot) {
                var stringValue = snapshot.data;
                if (stringValue == null) {
                  return CircularProgressIndicator();
                }
                return Text(stringValue.isEmpty ? "Empty" : stringValue);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<String> getText() async {
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      bgColor = Colors.blue[100]!;
    });
    print("function");
    return _controller.text;
  }
}
