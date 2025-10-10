import 'package:flutter/material.dart';

class AppSettingProvider extends ChangeNotifier {
  Locale _lang = Locale("en");

  get lang => _lang;

  void setLang(Locale lang) {
    _lang = lang;
    notifyListeners();
  }
}