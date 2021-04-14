import 'package:flutter/material.dart';
import 'package:mother_and_baby/lan/LanguageSi.dart';

import 'lan/LanguageEn.dart';
import 'lan/Languages.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'si'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    print('locale ' + locale.languageCode);
    switch (locale.languageCode) {
      case 'en':
        return LanguageSi();
      case 'si':
        return LanguageSi();
      default:
        return LanguageSi();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
