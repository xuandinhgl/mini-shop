import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mini_shop/l10n/app_localizations.dart';
import 'package:mini_shop/resources/view_models/app_setting_provider.dart';
import 'package:mini_shop/resources/view_models/category_provider.dart';
import 'package:mini_shop/resources/view_models/favorite_provider.dart';
import 'package:mini_shop/resources/view_models/navigation_provider.dart';
import 'package:mini_shop/resources/view_models/product_provider.dart';
import 'package:mini_shop/resources/view_models/shopping_cart_provider.dart';
import 'package:mini_shop/widgets/common/routers.dart';
import 'package:mini_shop/widgets/screens/home.dart';
import 'package:mini_shop/widgets/screens/onboarding.dart';
import 'package:mini_shop/widgets/screens/shopping_cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => ShoppingCartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => AppSettingProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<AppSettingProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: settingProvider.lang,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale("en"),
        Locale("vi"),
      ],
      title: 'MiniShop',
      home: const Onboarding(),
      routes: {
        Routers.home: (_) => HomeScreen(),
        Routers.shoppingCart: (_) => ShoppingCartScreen(),
      },
    );
  }
}
