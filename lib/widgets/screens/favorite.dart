import 'package:flutter/material.dart';
import 'package:mini_shop/resources/view_models/favorite_provider.dart';
import 'package:mini_shop/resources/view_models/product_provider.dart';
import 'package:mini_shop/widgets/common/styles.dart';
import 'package:mini_shop/widgets/components/product_card.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favoriteProducts = productProvider.getFavoriteProducts(
      favoriteProvider.favorites,
    );
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: favoriteProducts.isNotEmpty ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Favorite products",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 26,
              height: 1.2,
              color: Styles.colorLightBlue,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: favoriteProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: favoriteProducts[index]);
              },
            ),
          ),
        ],
      ) : Text("No favorite products", style: Styles.textH3Semibold,),
    );
  }
}
