import 'package:injectable/injectable.dart';
import 'package:knowunity/presentation/models/todo.dart';

@injectable
class TodoUsecase {
  const TodoUsecase();

  Future<List<Todo>> fetchTodos() async {
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(
      20,
      (index) {
        return Todo(
          title: 'title $index',
          completed: index.remainder(2).isOdd,
        );
      },
    );
  }
}
