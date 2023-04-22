import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:injectable/injectable.dart';
import 'package:knowunity/common/client/interceptors/log_interceptor.dart';
import 'package:knowunity/common/exceptions/incorrect_type_exception.dart';

@lazySingleton
class DioClient {
  final Dio dio;

  final RetryInterceptor retryInterceptor;

  const DioClient({
    required this.dio,
    required this.retryInterceptor,
  });

  @postConstruct
  void addInterceptors() {
    dio.addLogInterceptor();
    dio.interceptors.add(retryInterceptor);
  }

  Future<T> get<T>(
    final String path, {
    final CancelToken? cancelToken,
    final Map<String, String> overrideHeader = const {},
    final Map<String, dynamic>? queryParameters,
    final Duration? timeout,
  }) async {
    final response = await dio.get(
      path,
      cancelToken: cancelToken,
      queryParameters: queryParameters,
      options: Options(
        headers: overrideHeader,
        sendTimeout: timeout,
      ),
    );

    final data = response.data;
    if (data is T) {
      return data;
    } else {
      throw const IncorrectTypeException();
    }
  }
}
