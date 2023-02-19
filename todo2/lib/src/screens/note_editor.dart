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

  var isUpdate = false;
  Note? updateNote;

  var isCheckedTheUpdaterStat = false;

  loadUpdateData() {
    updateNote ??= ModalRoute.of(context)!.settings.arguments as Note?;
    isUpdate = updateNote != null;
    if (isUpdate) {
      titleTVC.text = updateNote?.title ?? "";
      bodyTVC.text = updateNote?.body ?? "";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!isCheckedTheUpdaterStat) {
      isCheckedTheUpdaterStat = !isCheckedTheUpdaterStat;
      loadUpdateData();
    }

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
    if (isUpdate) {
      var title = titleTVC.text;
      var body = bodyTVC.text;

      if (title.isEmpty && body.isEmpty) {
        Navigator.pop(context);
      }

      var mNote = Note(title: title, body: body, dateTime: DateTime.now());

      var prefs = await SharedPreferences.getInstance();
      var noteList = prefs.getStringList('notes') ?? [];

      var noteListModel = noteList.map((e) => Note.fromMap(e)).toList();

      var indexOfItem = 0;

      for (var i = 0; i < noteListModel.length; i++) {
        var noteTime = noteListModel[i].dateTime!.millisecondsSinceEpoch;

        var updaterTime = updateNote!.dateTime!.millisecondsSinceEpoch;
        if (noteTime == updaterTime) {
          indexOfItem = i;
          break;
        }
      }

      noteListModel[indexOfItem] = mNote;

      noteListModel.sort((a, b) {
        return b.dateTime!.compareTo(a.dateTime!);
      });

      noteList = noteListModel.map((e) => jsonEncode(e.toMap())).toList();

      prefs.setStringList('notes', noteList);
    } else {
      var title = titleTVC.text;
      var body = bodyTVC.text;

      if (title.isEmpty && body.isEmpty) {
        Navigator.pop(context);
      }

      var mNote = Note(title: title, body: body, dateTime: DateTime.now());

      var prefs = await SharedPreferences.getInstance();
      var noteList = prefs.getStringList('notes') ?? [];

      var noteListModel = noteList.map((e) => Note.fromMap(e)).toList();
      noteListModel.add(mNote);

      noteListModel.sort((a, b) {
        return b.dateTime!.compareTo(a.dateTime!);
      });

      noteList = noteListModel.map((e) => jsonEncode(e.toMap())).toList();

      prefs.setStringList('notes', noteList);
    }

    if (mounted) {
      Navigator.pop(context);
    }
  }
}
