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
        return Scaffold(
          appBar: AppBar(
            title: Text("Mini Shop"),
            backgroundColor: Styles.colorLightBlue,
            foregroundColor: Styles.colorBlack10,
            actions: [HeaderCart()],
          ),
          body: IndexedStack(index: nav.currentIndex, children: pages),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: nav.currentIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: "Categories",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favourite",
              ),
            ],
            onTap: nav.setIndex,
          ),
        );
      },
    );
  }
}
