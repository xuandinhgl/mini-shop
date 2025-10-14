import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/l10n/app_localizations.dart';
import 'package:mini_shop/resources/view_models/favorite_provider.dart';
import 'package:mini_shop/resources/view_models/product_provider.dart';
import 'package:mini_shop/widgets/common/styles.dart';
import 'package:mini_shop/widgets/components/product_row.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider);
    final favorite = ref.watch(favoriteProvider);
    final favoriteProducts = product.getFavoriteProducts(
      favorite.favorites,
    );

    final lang = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: favoriteProducts.isNotEmpty ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lang!.favoriteProducts,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 26,
              height: 1.2,
              color: Styles.colorLightBlue,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                return ProductRow(product: favoriteProducts[index]);
              },
            ),
          ),
        ],
      ) : Text(lang!.noFavoriteProducts, style: Styles.textH3Semibold,),
    );
  }
}
