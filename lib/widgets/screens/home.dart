import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/l10n/app_localizations.dart';
import 'package:mini_shop/resources/view_models/navigation_provider.dart';
import 'package:mini_shop/widgets/common/styles.dart';
import 'package:mini_shop/widgets/components/header_cart.dart';
import 'package:mini_shop/widgets/screens/categories.dart';
import 'package:mini_shop/widgets/screens/favorite.dart';
import 'package:mini_shop/widgets/screens/product.dart';
import 'package:mini_shop/widgets/screens/setting.dart' show SettingScreen;
import 'package:provider/provider.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final pages = [
    ProductScreen(),
    CategoriesScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final nav = ref.watch(navigationProvider);

    return Container(
      color: Styles.colorLightBlue,
      child: SafeArea(
        top: false,
        left: false,
        right: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(lang!.appName),
            backgroundColor: Styles.colorLightBlue,
            foregroundColor: Styles.colorBlack10,
            actions: [HeaderCart()],
          ),
          body: IndexedStack(index: nav.currentIndex, children: pages),
          bottomNavigationBar: CurvedNavigationBar(
            index: nav.currentIndex,
            color: Styles.colorLightBlue,
            backgroundColor: Colors.transparent,
            items: [
              Icon(Icons.home, color: Colors.white, size: 30),
              Icon(Icons.category, color: Colors.white, size: 30),
              Icon(Icons.favorite, color: Colors.white, size: 30),
              Icon(Icons.settings, color: Colors.white, size: 30),
            ],
            onTap: nav.setIndex,
          ),
        ),
      ),
    );
  }
}
