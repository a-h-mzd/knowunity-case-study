import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@singleton
class Env {
  static final isTest = Platform.environment.containsKey('FLUTTER_TEST');
  static final isNotTest = !isTest;

  static const isDebug = kDebugMode;
  static const isNotDebug = !isDebug;

  static const isProfile = kProfileMode;
  static const isNotProfile = !isProfile;

  static const isRelease = kReleaseMode;
  static const isNotRelease = !isRelease;

  static final isDebugButNotTest = isDebug && isNotTest;

  static bool get isIOS => Platform.isIOS;
  static bool get isAndroid => Platform.isAndroid;

  final host = 'https://jsonplaceholder.typicode.com';
}
