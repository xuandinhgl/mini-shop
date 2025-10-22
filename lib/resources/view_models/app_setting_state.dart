import 'package:flutter/material.dart';

class AppSettingState {
  Locale lang = Locale("en");

  AppSettingState({this.lang = const Locale("en")});

  AppSettingState copyWith({Locale? lang}) =>
      AppSettingState(lang: lang ?? this.lang);
}
