import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:knowunity/common/injector/injector.config.dart';

final _getIt = GetIt.instance;

@InjectableInit(
  throwOnMissingDependencies: true,
)
void configureDependencies() {
  _getIt.init();
}

T inject<T extends Object>({
  String? instanceName,
  dynamic param1,
  dynamic param2,
}) =>
    _getIt.get<T>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );

Future<T> injectAsync<T extends Object>({
  String? instanceName,
  dynamic param1,
  dynamic param2,
}) =>
    _getIt.getAsync<T>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );

T injectProvider<T extends ChangeNotifier>(
  BuildContext context, {
  String? instanceName,
  dynamic param,
}) =>
    inject<T>(
      instanceName: instanceName,
      param1: param,
      param2: context,
    );

extension InjectProvider on T Function<T extends ChangeNotifier>(
  BuildContext context, {
  String? instanceName,
  dynamic param,
}) {
  T Function<T extends ChangeNotifier>(BuildContext context) using(
    dynamic param, {
    String? instanceName,
  }) =>
      <T extends ChangeNotifier>(BuildContext c) => this(
            c,
            instanceName: instanceName,
            param: param,
          );
}
