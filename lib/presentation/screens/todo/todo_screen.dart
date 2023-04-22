import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:knowunity/common/injector/injector.dart';
import 'package:knowunity/presentation/screens/todo/todo_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class TodoScreen extends StatelessWidget with AutoRouteWrapper {
  const TodoScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return ChangeNotifierProvider<TodoProvider>(
      create: injectProvider,
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TodoProvider>();

    return const Scaffold();
  }
}
