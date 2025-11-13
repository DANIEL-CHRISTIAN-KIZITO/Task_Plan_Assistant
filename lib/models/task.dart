class Task {
  int? id;
  String title;
  String? note;
  bool isDone;

  Task({this.id, required this.title, this.note, this.isDone = false});

  // Convert a Task into a Map for database storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'note': note,
      'isDone': isDone ? 1 : 0,
    };
  }

  // Convert a Map into a Task
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      note: map['note'],
      isDone: map['isDone'] == 1,
    );
  }
}
