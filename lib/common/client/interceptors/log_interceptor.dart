import 'package:dio/dio.dart';
import 'package:knowunity/common/env/env.dart';

extension LogInterceptorExtension on Dio {
  void addLogInterceptor() {
    if (Env.isDebugButNotTest) {
      interceptors.add(
        LogInterceptor(
          requestHeader: false,
        ),
      );
    }
  }
}
