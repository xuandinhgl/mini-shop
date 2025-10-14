import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/l10n/app_localizations.dart';
import 'package:mini_shop/resources/view_models/product_provider.dart';
import 'package:mini_shop/widgets/common/styles.dart';
import 'package:mini_shop/widgets/components/product_card.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider);

    if(!product.isLoading && product.allProducts.isEmpty) {
      product.getProducts();
    }

    if (product.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final lang = AppLocalizations.of(context);

    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: Column(
        children: [
          Text(lang!.productRecommended, style: Styles.textH1Medium),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: product.allProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: product.allProducts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
