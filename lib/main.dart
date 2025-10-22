import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/l10n/app_localizations.dart';
import 'package:mini_shop/resources/view_models/app_setting_provider.dart';
import 'package:mini_shop/widgets/common/routers.dart';
import 'package:mini_shop/widgets/screens/home.dart';
import 'package:mini_shop/widgets/screens/onboarding.dart';
import 'package:mini_shop/widgets/screens/shopping_cart.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingProvider = ref.watch(appSettingNotifierProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: settingProvider.lang,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("en"), Locale("vi")],
      title: 'MiniShop',
      home: const Onboarding(),
      routes: {
        Routers.home: (_) => HomeScreen(),
        Routers.shoppingCart: (_) => ShoppingCartScreen(),
      },
    );
  }
}
