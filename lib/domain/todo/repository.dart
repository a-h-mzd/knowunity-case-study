import 'package:knowunity/data/models/todo.dart';

abstract class TodoRepository {
  Future<List<TodoApiModel>> fetchTodos();
}
