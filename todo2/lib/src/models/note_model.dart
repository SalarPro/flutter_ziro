class Note {
  String? title;
  String? body;
  DateTime? dateTime;

  Note({
    this.title,
    this.body,
    this.dateTime,
  });

  toMap() {
    return {
      'title': title,
      'body': body,
      'dateTime': dateTime,
    };
  }

  static fromMap(Map<String, dynamic> map) {
    return Note(
        title: map['title'], body: map['body'], dateTime: map['dateTime']);
  }
}
