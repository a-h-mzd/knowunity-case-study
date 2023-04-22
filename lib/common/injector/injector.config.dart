// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:dio_smart_retry/dio_smart_retry.dart' as _i8;
import 'package:flutter/material.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:knowunity/common/client/http_client.dart' as _i11;
import 'package:knowunity/common/env/env.dart' as _i4;
import 'package:knowunity/common/injector/modules/dio_module.dart' as _i12;
import 'package:knowunity/domain/todo/usecase.dart' as _i6;
import 'package:knowunity/l10n/localization.dart' as _i5;
import 'package:knowunity/presentation/router/router.dart' as _i3;
import 'package:knowunity/presentation/screens/todo/todo_provider.dart' as _i9;

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
    gh.singleton<_i3.AppRouter>(_i3.AppRouter());
    gh.singleton<_i4.Env>(_i4.Env());
    gh.singleton<_i5.LocaleProvider>(_i5.LocaleProvider());
    gh.factory<_i6.TodoUsecase>(() => _i6.TodoUsecase());
    gh.lazySingleton<_i7.Transformer>(() => dioModule.backgroundTransformer);
    gh.lazySingleton<_i7.Dio>(() => dioModule.getDio(
          gh<_i4.Env>(),
          gh<_i7.Transformer>(),
        ));
    gh.lazySingleton<_i8.RetryInterceptor>(
        () => dioModule.retryInterceptor(gh<_i7.Dio>()));
    gh.factoryParam<_i9.TodoProvider, _i10.ScrollController, dynamic>((
      scrollController,
      _,
    ) =>
        _i9.TodoProvider(
          scrollController: scrollController,
          todoUsecase: gh<_i6.TodoUsecase>(),
        )..initialize());
    gh.lazySingleton<_i11.DioClient>(() => _i11.DioClient(
          dio: gh<_i7.Dio>(),
          retryInterceptor: gh<_i8.RetryInterceptor>(),
        )..addInterceptors());
    return this;
  }
}

class _$DioModule extends _i12.DioModule {}
