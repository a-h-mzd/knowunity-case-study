import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:knowunity/common/injector/injector.dart';
import 'package:knowunity/l10n/localization.dart';
import 'package:knowunity/presentation/components/gesture_sliver_fill_remaining.dart';
import 'package:knowunity/presentation/components/navigation_bar.dart';
import 'package:knowunity/presentation/components/new_todo_button.dart';
import 'package:knowunity/presentation/components/todo_list.dart';
import 'package:knowunity/presentation/screens/todo/todo_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class TodoScreen extends StatelessWidget with AutoRouteWrapper {
  const TodoScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    final scrollController = PrimaryScrollController.of(context);
    return ChangeNotifierProvider<TodoProvider>(
      create: injectProvider.using(scrollController),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TodoProvider>();

    FocusScope.of(context);
    final focusScope = provider.focusScope;
    final isFocused = focusScope.hasFocus;

    final scrollController = provider.scrollController;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FocusScope(
            node: provider.focusScope,
            onFocusChange: provider.onFocusChange,
            child: SlidableAutoCloseBehavior(
              child: CustomScrollView(
                controller: scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                slivers: [
                  TodoSliverNavigationBar(
                    title: context.localizations.todos,
                  ),
                  TodoList(
                    todos: provider.todos,
                    methodProvider: provider,
                  ),
                  if (!isFocused)
                    SliverToBoxAdapter(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap:
                            isFocused ? focusScope.unfocus : provider.newTodo,
                        child: const SafeArea(
                          top: false,
                          child: SizedBox(height: 56 + 1),
                        ),
                      ),
                    ),
                  GestureSliverFillRemaining(
                    isLoading: false,
                    hasTodos: provider.todos.isNotEmpty,
                    onTap: isFocused ? focusScope.unfocus : provider.newTodo,
                  ),
                ],
              ),
            ),
          ),
          if (!isFocused)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: NewTodoButton(
                onTap: provider.newTodo,
                scrollController: scrollController,
              ),
            ),
        ],
      ),
    );
  }
}
