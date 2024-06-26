import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../generated/strings.g.dart';
import '../../../../domain/repository/setting/setting_repository.dart';

part '../../../../../generated/src/presentation/home/store/language/language_store.g.dart';

class LanguageStore = _LanguageStore with _$LanguageStore;

abstract class _LanguageStore with Store {
  // repository instance
  final SettingRepository _repository;

  // supported languages
  List<Locale> supportedLanguages = AppLocaleUtils.supportedLocales;

  // constructor:---------------------------------------------------------------
  _LanguageStore(this._repository) {
    init();
  }

  // store variables:-----------------------------------------------------------
  @observable
  String _locale = 'en';

  @computed
  String get locale => _locale;

  // actions:-------------------------------------------------------------------
  @action
  void changeLanguage(String value) {
    _locale = value;
    _repository.changeLanguage(value).then((_) {
      // write additional logic here
    });
  }

  @action
  String getCode() {
    String? code;

    if (_locale == 'en') {
      code = 'US';
    } else if (_locale == 'da') {
      code = 'DK';
    } else if (_locale == 'es') {
      code = 'ES';
    }

    return code ?? 'en';
  }

  @action
  String getLanguage() {
    final index = supportedLanguages.indexWhere((language) => language.languageCode == _locale);

    if (index != -1) {
      return supportedLanguages[index].languageCode;
    } else {
      return supportedLanguages.first.languageCode;
    }
  }

  // general:-------------------------------------------------------------------
  void init() async {
    // getting current language from shared preference
    if (_repository.currentLanguage != null) {
      _locale = _repository.currentLanguage!;
    }
  }

  // dispose:-------------------------------------------------------------------
  dispose() {}
}
