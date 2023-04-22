import 'package:flutter/material.dart';
import 'package:knowunity/data/models/todo.dart';

class Todo {
  Todo({
    String title = '',
    this.completed = false,
  }) : controller = TextEditingController(text: title);

  Todo.fromApiModel(TodoApiModel todo)
      : completed = todo.completed,
        controller = TextEditingController(text: todo.title);

  final key = UniqueKey();
  final focus = FocusNode();

  bool completed;
  final TextEditingController controller;
}
