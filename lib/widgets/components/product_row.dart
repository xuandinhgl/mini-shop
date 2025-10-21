import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/l10n/app_localizations.dart';
import 'package:mini_shop/resources/models/product.dart';
import 'package:mini_shop/resources/view_models/favorite_notifier.dart';
import 'package:mini_shop/widgets/common/styles.dart';
import 'package:mini_shop/widgets/screens/product_detail.dart';
import 'package:provider/provider.dart';

class ProductRow extends ConsumerWidget {
  const ProductRow({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteNotifier = ref.watch(favoriteNotifierProvider.notifier);
    final lang = AppLocalizations.of(context);
    return Dismissible(
      key: ValueKey(product.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) {
        favoriteNotifier.toggleFavorite(context, product.id);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(lang!.favoriteProductRemoved)));
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailScreen(product: product),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Styles.colorBlack20)),
          ),
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: product.thumbnail,
                width: 20,
                height: 30,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.broken_image, size: 50),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textBody1Semibold,
                    ),
                    Text("\$${product.price}"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
