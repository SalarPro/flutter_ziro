import 'package:flutter/material.dart';
import 'package:todo2/src/screens/note_editor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isNoteEmpty = false;

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
              icon: Icon(Icons.add_rounded))
        ],
      ),
      body: isNoteEmpty
          // if the notes are empty
          ? Center(
              child: TextButton(
              onPressed: () {},
              child: Text("Write your frirst note",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ))
          // if notes are not empty show theme
          : ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Title",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                  "Body Text budy Text Body Text budy Text Body Text bu kjsajkl fhaksjd hfkjas dhfkljhas dkjfhaskljdh fkjasdh kjfhs ajkldhf kajlsdh fkjlasdh jkfghsddy Text Body Text budy Text Body Text budy Text ",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 14)),
                              SizedBox(
                                height: 15,
                              ),
                              Text("2023/01/4 12:45 a",
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              size: 50,
                              color: Colors.red[400],
                            )),
                      ),
                    ],
                  ),
                );
              }),
    );
  }
}
