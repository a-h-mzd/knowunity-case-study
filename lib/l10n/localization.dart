import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension Localization on BuildContext {
  AppLocalizations get localizations {
    return AppLocalizations.of(this)!;
  }
}

extension on LocaleProvider {
  void updateAppLocalizationsWithoutContext() {
    final locale = _locale ??
        basicLocaleListResolution(
          WidgetsBinding.instance.platformDispatcher.locales,
          AppLocalizations.supportedLocales,
        );

    _appLocalization = lookupAppLocalizations(locale);
  }
}

@singleton
class LocaleProvider extends WidgetsBindingObserver with ChangeNotifier {
  LocaleProvider() {
    WidgetsBinding.instance.addObserver(this);
    updateAppLocalizationsWithoutContext();
  }

  Locale? _locale;

  Locale? get locale => _locale;

  late AppLocalizations _appLocalization;
  AppLocalizations get appLocalization => _appLocalization;

  Future<void> setLocale(final Locale? newLocale) async {
    _locale = newLocale;
    notifyListeners();
    updateAppLocalizationsWithoutContext();
  }

  @override
  void didChangeLocales(List<Locale>? _) {
    updateAppLocalizationsWithoutContext();
  }
}
