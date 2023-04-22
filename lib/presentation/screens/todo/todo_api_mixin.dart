import 'package:flutter/foundation.dart';
import 'package:knowunity/presentation/models/todo.dart';

mixin TodoApiMixin on ChangeNotifier {
  bool get isFetchingTodos => _isFetching;
  bool _isFetching = false;

  bool get errorFetchingTodos => _errorFetching;
  bool _errorFetching = false;

  List<Todo> get todos;

  Future<void> fetchTodos() async {
    if (_isFetching) {
      return;
    }

    _errorFetching = false;
    _isFetching = true;
    notifyListeners();

    try {
      // TODO(a-h-mzd): Fetch todos here.
      todos.addAll(
        List.generate(
          20,
          (index) {
            return Todo(
              title: 'title $index',
              completed: index.remainder(2).isOdd,
            );
          },
        ),
      );
    } catch (e) {
      _errorFetching = true;
    }

    _isFetching = false;
    notifyListeners();
  }
}
