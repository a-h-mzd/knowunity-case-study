import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:injectable/injectable.dart';
import 'package:knowunity/common/env/env.dart';

@module
abstract class DioModule {
  @lazySingleton
  Transformer get backgroundTransformer => BackgroundTransformer();

  @lazySingleton
  RetryInterceptor retryInterceptor(Dio dio) {
    return RetryInterceptor(
      dio: dio,
      retries: 1,
      retryDelays: const [
        Duration(seconds: 1),
      ],
    );
  }

  @lazySingleton
  Dio getDio(Env env, Transformer transformer) {
    return Dio(
      BaseOptions(
        baseUrl: env.host,
        contentType: ContentType.json.mimeType,
      ),
    )..transformer = transformer;
  }
}
