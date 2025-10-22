import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/resources/view_models/app_setting_state.dart';

final appSettingNotifierProvider =
    NotifierProvider<AppSettingNotifier, AppSettingState>(
      AppSettingNotifier.new,
    );

class AppSettingNotifier extends Notifier<AppSettingState> {
  void setLang(Locale lang) {
    state = state.copyWith(lang: lang);
  }

  @override
  AppSettingState build() => AppSettingState();
}
