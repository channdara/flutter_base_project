import 'package:flutterapp/src/model/todo.dart';

class TodoResponse {
  TodoResponse(this.todos);

  factory TodoResponse.fromMap(dynamic map) {
    final List<Todo> todos = [];
    for (final todo in map) todos.add(Todo.fromMap(todo));
    return TodoResponse(todos);
  }

  final List<Todo> todos;
}
