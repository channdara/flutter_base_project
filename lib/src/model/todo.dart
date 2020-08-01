class Todo {
  Todo({this.userID, this.id, this.title, this.completed});

  factory Todo.fromMap(dynamic map) => Todo(
        userID: map['userId'].toString(),
        id: map['id'].toString(),
        title: map['title'].toString(),
        completed: map['completed'].toString(),
      );

  final String userID;
  final String id;
  final String title;
  final String completed;

  bool get isCompleted => completed.toLowerCase() == 'true';
}
