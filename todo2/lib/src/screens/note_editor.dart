import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo2/src/models/note_model.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  TextEditingController titleTVC = TextEditingController();
  TextEditingController bodyTVC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 33, 55),
      appBar: AppBar(
        title: Text("New Note"),
        actions: [
          IconButton(
              onPressed: () {
                saveAndQuit();
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.white),
            child: TextField(
              controller: titleTVC,
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
              controller: bodyTVC,
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

  void saveAndQuit() async {
    var title = titleTVC.text;
    var body = bodyTVC.text;

    if (title.isEmpty && body.isEmpty) {
      Navigator.pop(context);
    }

    var mNote = Note(title: title, body: body, dateTime: DateTime.now());

    var mNoteMap = mNote.toMap();

    var jsonString = jsonEncode(mNoteMap);

    var prefs = await SharedPreferences.getInstance();
    var noteList = prefs.getStringList('notes') ?? [];

    noteList.add(jsonString);

    prefs.setStringList('notes', noteList);

    if (mounted) {
      Navigator.pop(context);
    }
  }
}
