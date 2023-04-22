import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:knowunity/presentation/components/text_field.dart';
import 'package:knowunity/presentation/models/todo.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  final Widget? trailing;
  final Widget? dismissible;
  final List<Widget> slidableActions;
  final void Function()? onRadioTap;
  final void Function()? onTextFieldTap;
  final void Function()? onEditingComplete;

  const TodoTile({
    super.key,
    required this.todo,
    this.trailing,
    this.dismissible,
    required this.slidableActions,
    this.onRadioTap,
    this.onTextFieldTap,
    this.onEditingComplete,
  });

  MaterialStateProperty<Color> get radioFillColor {
    return MaterialStateColor.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return CupertinoColors.activeOrange;
        } else {
          return CupertinoColors.systemGrey;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final trailing = this.trailing;
    final todoKey = todo.key;
    return Material(
      child: Slidable(
        key: todoKey,
        groupTag: #todos,
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: .2,
          dismissible: dismissible,
          children: slidableActions,
        ),
        child: Row(
          children: [
            Radio(
              visualDensity: VisualDensity.compact,
              fillColor: radioFillColor,
              value: todo.completed,
              groupValue: true,
              toggleable: true,
              onChanged: (_) => onRadioTap?.call(),
            ),
            Expanded(
              child: Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: KnowunityTextField(
                            minHeight: 50,
                            focusNode: todo.focus,
                            controller: todo.controller,
                            onEditingComplete: onEditingComplete,
                            onTap: onTextFieldTap,
                          ),
                        ),
                        if (trailing != null) ...[
                          const SizedBox(width: 8),
                          trailing,
                        ],
                        const SizedBox(width: 12),
                      ],
                    ),
                  ),
                  Container(
                    height: 0.5,
                    color: CupertinoColors.systemGrey2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
