import 'package:flutter/material.dart';
import 'package:knowunity/common/flutter_gen/fonts.gen.dart';
import 'package:knowunity/l10n/localization.dart';
import 'package:knowunity/presentation/router/router.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final AppRouter router;
  final LocaleProvider localeProvider;

  const App({
    required this.router,
    required this.localeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: localeProvider,
      child: KnowunityApp(router: router),
    );
  }
}

class KnowunityApp extends StatelessWidget {
  final AppRouter router;

  const KnowunityApp({
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Knowunity',
      theme: ThemeData(fontFamily: FontFamily.sFProRounded),
      routerConfig: router.config(),
      locale: context.watch<LocaleProvider>().locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      debugShowCheckedModeBanner: false,
    );
  }
}
