import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> todos = [];

  TextEditingController todoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("TODO!"),
            SizedBox(width: 10),
            Icon(Icons.edit),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(18),
            child: TextField(
              controller: todoTextController,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                //todo add text from text field to the list

                if (todoTextController.text.isEmpty) {
                  print("the text field is empty");
                  return;
                }
                setState(() {
                  todos.add(todoTextController.text);
                  todoTextController.clear();
                  print(todos);
                });
              },
              child: Text("Add")),
          SizedBox(
            height: 200,
            child: ListView(
              children: [
                for (var i = 0; i < todos.length; i++)
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 8, 13, 90),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      todos[i],
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}