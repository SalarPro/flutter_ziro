import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo2/src/models/note_model.dart';
import 'package:todo2/src/screens/note_editor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isNoteEmpty = false;

  Future<List<Note>> getNoteData() async {
    List<Note> mNotes = [];
    var sharedPref = await SharedPreferences.getInstance();

    var noteJsonList = sharedPref.getStringList('notes') ?? [];

    mNotes.clear();

    noteJsonList.forEach((element) {
      //elemnt json string => Note
      var note = Note.fromMap(element);
      mNotes.add(note);
    });

    return mNotes;
  }

  deleteNote(index) async {
    var sharedPref = await SharedPreferences.getInstance();
    var mList = sharedPref.getStringList('notes') ?? [];
    mList.removeAt(index);
    sharedPref.setStringList('notes', mList);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 6, 34, 75),
      appBar: AppBar(
        title: Text("Welcome Salar"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NoteEditorScreen()));
              },
              icon: Icon(Icons.add_rounded)),
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder<List<Note>>(
          future: getNoteData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: TextButton(
                onPressed: () {},
                child: Text("Write your frirst note",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ));
            }
            var mNotes = snapshot.data!;
            return ListView.builder(
                itemCount: mNotes.length,
                itemBuilder: (context, index) {
                  return getNoteCell(mNotes[index], index);
                });
          }),
    );
  }

  Widget getNoteCell(Note mNote, int index) {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NoteEditorScreen(),
                  settings: RouteSettings(arguments: mNote)));
        },
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mNote.title ?? "",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(mNote.body ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14)),
                    SizedBox(
                      height: 15,
                    ),
                    Text(DateFormat("yy-M-d h:ma").format(mNote.dateTime!),
                        style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
            Container(
              height: 70,
              width: 70,
              child: IconButton(
                  onPressed: () {
                    showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoActionSheet(
                            title: Text("Are you sure you want to delete"),
                            actions: [
                              CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('No')),
                              CupertinoActionSheetAction(
                                  isDestructiveAction: true,
                                  onPressed: () {
                                    deleteNote(index);
                                    Navigator.pop(context);
                                  },
                                  child: Text('DELETE'))
                            ],
                          );
                        });
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 50,
                    color: Colors.red[400],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
