import 'package:flutter/material.dart';
import 'package:knowunity/common/injector/injector.dart';
import 'package:knowunity/presentation/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(
    App(
      router: inject(),
      localeProvider: inject(),
    ),
  );
}
