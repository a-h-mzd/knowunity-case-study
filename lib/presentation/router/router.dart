import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:knowunity/presentation/screens/todo/todo_screen.dart';

part 'router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final routes = <AutoRoute>[
    AutoRoute(page: TodoRoute.page, path: '/'),
  ];
}
