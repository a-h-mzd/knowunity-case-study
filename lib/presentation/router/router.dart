import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

part 'router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final routes = <AutoRoute>[
    //
  ];
}
