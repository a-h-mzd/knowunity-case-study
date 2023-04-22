import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:knowunity/presentation/components/todo_list.dart';
import 'package:knowunity/presentation/models/todo.dart';
import 'package:knowunity/presentation/screens/todo/todo_api_mixin.dart';

@injectable
class TodoProvider extends ChangeNotifier
    with TodoApiMixin
    implements TodoListMethodProvider {
  @override
  final todos = <Todo>[];
  final focusScope = FocusScopeNode();
  final ScrollController scrollController;

  TodoProvider({
    @factoryParam required this.scrollController,
  });

  @postConstruct
  void initialize() {
    fetchTodos();
  }

  Future<void> newTodo() async {
    void insertTodo() {
      final todo = Todo();
      todos.insert(0, todo);
      notifyListeners();
      todo.focus.requestFocus();
    }

    if (scrollController.offset == 0) {
      insertTodo();
    } else {
      await scrollController.animateTo(
        0,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
      );
      if (scrollController.offset == 0) {
        insertTodo();
      }
    }
  }

  void onFocusChange(bool hasFocus) {
    if (!hasFocus) {
      _removeEmptyTodos();
    }
  }

  @override
  void onReorderEnd(final int index) {
    _removeEmptyTodos();
  }

  @override
  void onReorder(final int oldIndex, final int newIndex) {
    if (oldIndex > newIndex) {
      final todo = todos.removeAt(oldIndex);
      todos.insert(newIndex, todo);
    } else {
      final todo = todos[oldIndex];
      todos.insert(newIndex, todo);
      todos.removeAt(oldIndex);
    }
    notifyListeners();
  }

  @override
  void todoDismissed(final Key todoKey) {
    todos.removeWhere((todo) => todo.key == todoKey);
    notifyListeners();
  }

  @override
  void onRadioTap(int index) {
    final todo = todos[index];
    todo.completed = !todo.completed;
    notifyListeners();
  }

  @override
  void onEditingComplete() {
    focusScope.unfocus();
  }

  @override
  void onTextFieldTap(int index) {
    final todo = todos[index];
    final key = todo.key;
    _removeEmptyTodos(exceptionKey: key);
  }

  void _removeEmptyTodos({Key? exceptionKey}) {
    todos.removeWhere((todo) {
      final isEmpty = todo.controller.text.isEmpty;
      final isException = todo.key == exceptionKey;
      return isEmpty && !isException;
    });
    notifyListeners();
  }
}
