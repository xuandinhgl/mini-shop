import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/l10n/app_localizations.dart';
import 'package:mini_shop/resources/models/product.dart';
import 'package:mini_shop/resources/view_models/favorite_notifier.dart';
import 'package:mini_shop/resources/view_models/product_notifier.dart';
import 'package:mini_shop/resources/view_models/shopping_cart_provider.dart';
import 'package:mini_shop/widgets/common/styles.dart';
import 'package:mini_shop/widgets/components/header_cart.dart';


final productInitProvider = FutureProvider.family.autoDispose<Product?, int>((ref, productId) async {
  return ref.read(productNotifierProvider.notifier).getProductById(productId);
});

class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.read(shoppingCartProvider);
    final lang = AppLocalizations.of(context);
    final favorite = ref.watch(favoriteNotifierProvider);
    final favoriteNotifier = ref.watch(favoriteNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product detail"),
        backgroundColor: Styles.colorLightBlue,
        foregroundColor: Colors.white,
        actions: [HeaderCart()],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: CachedNetworkImage(
                imageUrl: product.thumbnail,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.broken_image, size: 50)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 2.4,
                ),
                decoration: BoxDecoration(
                  color: Styles.colorBlack10,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title, style: Styles.textH3Bold),
                    SizedBox(height: 10),
                    Text(
                      "\$${product.price}",
                      style: TextStyle(
                        color: Styles.colorLightBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              cart.addToCart(context, product);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Styles.colorLightBlue,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                                left: 20,
                                right: 10,
                              ),
                            ),
                            child: Text(lang!.addToCart),
                          ),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
                            favoriteNotifier.toggleFavorite(context, product.id);
                          },
                          icon: Icon(Icons.favorite),
                          color: favoriteNotifier.isFavorited(product.id)
                              ? Styles.colorDarkTYellow
                              : Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(lang.detail, style: Styles.textBody1Semibold),
                    SizedBox(height: 20),
                    Text(
                      product.description ?? "",
                      style: Styles.textBody1Regular,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
