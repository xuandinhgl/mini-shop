import 'package:flutter/material.dart';
import 'package:mini_shop/resources/view_models/app_setting_provider.dart';
import 'package:mini_shop/widgets/common/styles.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width / 2 - 30;
    final settingProvider = Provider.of<AppSettingProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              settingProvider.setLang(Locale("en"));
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(buttonWidth, 50),
              backgroundColor: settingProvider.lang == Locale("en")
                  ? Styles.colorLightBlue
                  : Colors.grey,
              foregroundColor: Colors.white,
            ),
            child: const Text("English"),
          ),
          SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              settingProvider.setLang(Locale("vi"));
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(buttonWidth, 50),
              backgroundColor: settingProvider.lang == Locale("vi")
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
