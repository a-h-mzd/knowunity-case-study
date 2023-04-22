import 'package:injectable/injectable.dart';
import 'package:knowunity/domain/todo/repository.dart';
import 'package:knowunity/presentation/models/todo.dart';

@injectable
class TodoUsecase {
  final TodoRepository todoRepository;

  const TodoUsecase({
    required this.todoRepository,
  });

  Future<List<Todo>> fetchTodos() async {
    final todos = await todoRepository.fetchTodos();
    return todos.map(Todo.fromApiModel).toList();
  }
}
