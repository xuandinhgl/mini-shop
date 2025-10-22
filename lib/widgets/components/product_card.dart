import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/resources/models/product.dart';
import 'package:mini_shop/resources/view_models/shopping_cart_notifier.dart';
import 'package:mini_shop/widgets/common/styles.dart';
import 'package:mini_shop/widgets/screens/product_detail.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.watch(shoppingCartNotifierProvider.notifier);

    return Container(
      decoration: BoxDecoration(
        color: Styles.colorBlack10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: CachedNetworkImage(
              imageUrl: product.thumbnail,
              width: 138,
              height: 138,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.broken_image, size: 50),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(product: product),
                ),
              );
            },
          ),
          const SizedBox(height: 5),
          GestureDetector(
            child: Text(
              product.title,
              style: Styles.textH3Semibold,
              maxLines: 1,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(product: product),
                ),
              );
            },
          ),
          Text(
            product.category.name,
            style: Styles.textBody1Medium,
            maxLines: 1,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$${product.price}", style: Styles.textBody1Semibold),
                  SizedBox(width: 5),
                  IconButton(
                    onPressed: () {
                      cartNotifier.addToCart(context, product);
                    },
                    icon: Icon(Icons.add),
                    iconSize: 30,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Styles.colorLightBlue,
                      ),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
