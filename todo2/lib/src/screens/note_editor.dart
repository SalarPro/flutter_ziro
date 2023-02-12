import 'package:flutter/material.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 33, 55),
      appBar: AppBar(
        title: Text("New Note"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.white),
            child: TextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration:
                  InputDecoration(border: InputBorder.none, labelText: "Title"),
            ),
          ),
          Container(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.75),
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.white),
            child: TextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration:
                  InputDecoration(border: InputBorder.none, labelText: "Body"),
            ),
          )
        ],
      ),
    );
  }
}
