import 'dart:convert';

class Note {
  String? title;
  String? body;
  DateTime? dateTime;

  Note({
    this.title,
    this.body,
    this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
      'dateTime': dateTime?.toIso8601String(),
    };
  }

  static Note fromMap(String stringMap) {
    var map = json.decode(stringMap) as Map<String, dynamic>;
    return Note(
        title: map['title'],
        body: map['body'],
        dateTime: DateTime.tryParse(map['dateTime']));
  }
}
