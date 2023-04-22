// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:dio_smart_retry/dio_smart_retry.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:knowunity/common/client/http_client.dart' as _i6;
import 'package:knowunity/common/env/env.dart' as _i3;
import 'package:knowunity/common/injector/modules/dio_module.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.singleton<_i3.Env>(_i3.Env());
    gh.lazySingleton<_i4.Transformer>(() => dioModule.backgroundTransformer);
    gh.lazySingleton<_i4.Dio>(() => dioModule.getDio(
          gh<_i3.Env>(),
          gh<_i4.Transformer>(),
        ));
    gh.lazySingleton<_i5.RetryInterceptor>(
        () => dioModule.retryInterceptor(gh<_i4.Dio>()));
    gh.lazySingleton<_i6.DioClient>(() => _i6.DioClient(
          dio: gh<_i4.Dio>(),
          retryInterceptor: gh<_i5.RetryInterceptor>(),
        )..addInterceptors());
    return this;
  }
}

class _$DioModule extends _i7.DioModule {}
