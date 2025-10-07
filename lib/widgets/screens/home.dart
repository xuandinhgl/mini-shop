import 'package:flutter/material.dart';
import 'package:mini_shop/resources/view_models/navigation_provider.dart';
import 'package:mini_shop/resources/view_models/shopping_cart_provider.dart';
import 'package:mini_shop/widgets/common/routers.dart';
import 'package:mini_shop/widgets/common/styles.dart';
import 'package:mini_shop/widgets/screens/categories.dart';
import 'package:mini_shop/widgets/screens/favorite.dart';
import 'package:mini_shop/widgets/screens/product.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final pages = [ProductScreen(), CategoriesScreen(), FavoriteScreen()];

  @override
  Widget build(BuildContext context) {
    return Consumer2<ShoppingCartProvider, NavigationProvider>(
      builder: (context, cart, nav, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Mini Shop"),
            backgroundColor: Styles.colorLightBlue,
            foregroundColor: Styles.colorBlack10,
            actions: [
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routers.shoppingCart);
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                  Positioned(
                    right: 5,
                    top: 4,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Styles.colorDarkTYellow,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        cart.count.toString(),
                        style: TextStyle(
                          color: Styles.colorBlack10,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
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
