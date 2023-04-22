// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:dio_smart_retry/dio_smart_retry.dart' as _i9;
import 'package:flutter/widgets.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:knowunity/common/client/http_client.dart' as _i10;
import 'package:knowunity/common/env/env.dart' as _i4;
import 'package:knowunity/common/injector/modules/dio_module.dart' as _i11;
import 'package:knowunity/l10n/localization.dart' as _i5;
import 'package:knowunity/presentation/router/router.dart' as _i3;
import 'package:knowunity/presentation/screens/todo/todo_provider.dart' as _i6;

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
    gh.factoryParam<_i6.TodoProvider, _i7.ScrollController, dynamic>((
      scrollController,
      _,
    ) =>
        _i6.TodoProvider(scrollController: scrollController));
    gh.lazySingleton<_i8.Transformer>(() => dioModule.backgroundTransformer);
    gh.lazySingleton<_i8.Dio>(() => dioModule.getDio(
          gh<_i4.Env>(),
          gh<_i8.Transformer>(),
        ));
    gh.lazySingleton<_i9.RetryInterceptor>(
        () => dioModule.retryInterceptor(gh<_i8.Dio>()));
    gh.lazySingleton<_i10.DioClient>(() => _i10.DioClient(
          dio: gh<_i8.Dio>(),
          retryInterceptor: gh<_i9.RetryInterceptor>(),
        )..addInterceptors());
    return this;
  }
}

class _$DioModule extends _i11.DioModule {}
