import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/resources/view_models/app_setting_provider.dart';
import 'package:mini_shop/widgets/common/styles.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonWidth = MediaQuery.of(context).size.width / 2 - 30;
    final setting = ref.watch(appSettingNotifierProvider);
    final settingNotifier = ref.watch(appSettingNotifierProvider.notifier);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              settingNotifier.setLang(Locale("en"));
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(buttonWidth, 50),
              backgroundColor: setting.lang == Locale("en")
                  ? Styles.colorLightBlue
                  : Colors.grey,
              foregroundColor: Colors.white,
            ),
            child: const Text("English"),
          ),
          SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              settingNotifier.setLang(Locale("vi"));
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(buttonWidth, 50),
              backgroundColor: setting.lang == Locale("vi")
                  ? Styles.colorLightBlue
                  : Colors.grey,
              foregroundColor: Colors.white,
            ),
            child: const Text("Vietnamese"),
          ),
        ],
      ),
    );
  }
}
