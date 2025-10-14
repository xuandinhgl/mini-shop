import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appSettingProvider = ChangeNotifierProvider<AppSettingProvider>((ref) => AppSettingProvider());
class AppSettingProvider extends ChangeNotifier {
  Locale _lang = Locale("en");

  get lang => _lang;

  void setLang(Locale lang) {
    _lang = lang;
    notifyListeners();
  }
}