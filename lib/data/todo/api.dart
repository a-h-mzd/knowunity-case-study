import 'package:injectable/injectable.dart';
import 'package:knowunity/common/client/http_client.dart';
import 'package:knowunity/data/models/todo.dart';
import 'package:knowunity/domain/todo/repository.dart';

@Injectable(as: TodoRepository)
class TodoApi implements TodoRepository {
  const TodoApi({
    required this.dioClient,
  });

  final DioClient dioClient;

  @override
  Future<List<TodoApiModel>> fetchTodos() async {
    final todos = await dioClient.get<List>('/todos');
    return todos
        .cast<Map<String, Object?>>()
        .map(TodoApiModel.fromJson)
        .toList();
  }
}
