import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mini_shop/resources/view_models/navigation_provider.dart';
import 'package:mini_shop/widgets/common/styles.dart';
import 'package:mini_shop/widgets/components/header_cart.dart';
import 'package:mini_shop/widgets/screens/categories.dart';
import 'package:mini_shop/widgets/screens/favorite.dart';
import 'package:mini_shop/widgets/screens/product.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final pages = [ProductScreen(), CategoriesScreen(), FavoriteScreen()];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, nav, child) {
        return Container(
          color: Styles.colorLightBlue,
          child: SafeArea(
            top: false,
            left: false,
            right: false,
            child: Scaffold(
              appBar: AppBar(
                title: Text("Mini Shop"),
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
                ],
                onTap: nav.setIndex,
              ),
            ),
          ),
        );
      },
    );
  }
}
