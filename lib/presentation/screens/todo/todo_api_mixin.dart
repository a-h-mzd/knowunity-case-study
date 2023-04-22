import 'package:flutter/foundation.dart';
import 'package:knowunity/domain/todo/usecase.dart';
import 'package:knowunity/presentation/models/todo.dart';

mixin TodoApiMixin on ChangeNotifier {
  bool get isFetchingTodos => _isFetching;
  bool _isFetching = false;

  bool get errorFetchingTodos => _errorFetching;
  bool _errorFetching = false;

  TodoUsecase get todoUsecase;
  List<Todo> get todos;

  Future<void> fetchTodos() async {
    if (_isFetching) {
      return;
    }

    _errorFetching = false;
    _isFetching = true;
    notifyListeners();

    try {
      final fetchedTodos = await todoUsecase.fetchTodos();
      todos.addAll(fetchedTodos);
    } catch (e) {
      _errorFetching = true;
    }

    _isFetching = false;
    notifyListeners();

    onTodosFetched();
  }

  @protected
  void onTodosFetched() {}
}
