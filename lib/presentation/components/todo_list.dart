
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:knowunity/l10n/localization.dart';
import 'package:knowunity/presentation/components/todo_tile.dart';
import 'package:knowunity/presentation/models/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final TodoListMethodProvider methodProvider;

  const TodoList({
    super.key,
    required this.todos,
    required this.methodProvider,
  });

  @override
  Widget build(BuildContext context) {
    return SliverReorderableList(
      onReorder: (oldIndex, newIndex) {
        methodProvider.onReorder(oldIndex, newIndex);
        methodProvider.onReorderEnd(newIndex);
      },
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        final todoKey = todo.key;
        return ReorderableDelayedDragStartListener(
          key: todoKey,
          index: index,
          child: TodoTile(
            todo: todo,
            dismissible: DismissiblePane(
              resizeDuration: const Duration(milliseconds: 100),
              onDismissed: () => methodProvider.todoDismissed(todoKey),
            ),
            slidableActions: [
              SlidableAction(
                onPressed: (_) => methodProvider.todoDismissed(todoKey),
                backgroundColor: CupertinoColors.destructiveRed,
                icon: Icons.delete,
                label: context.localizations.delete,
              ),
            ],
            onRadioTap: () => methodProvider.onRadioTap(index),
            trailing: ReorderableDragStartListener(
              index: index,
              child: const Icon(
                Icons.menu,
                color: CupertinoColors.systemGrey2,
              ),
            ),
            onEditingComplete: methodProvider.onEditingComplete,
            onTextFieldTap: () => methodProvider.onTextFieldTap(index),
          ),
        );
      },
    );
  }
}

abstract class TodoListMethodProvider {
  void onReorderEnd(final int index);
  void onReorder(final int oldIndex, final int newIndex);
  void todoDismissed(final Key todoKey);
  void onRadioTap(int index);
  void onEditingComplete();
  void onTextFieldTap(int index);
}
