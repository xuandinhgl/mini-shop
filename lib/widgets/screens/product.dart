import 'package:flutter/material.dart';
import 'package:mini_shop/l10n/app_localizations.dart';
import 'package:mini_shop/resources/view_models/product_provider.dart';
import 'package:mini_shop/widgets/common/styles.dart';
import 'package:mini_shop/widgets/components/product_card.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = _key.currentContext;

      if (ctx == null) {
        return;
      }
      final productProvider = Provider.of<ProductProvider>(ctx, listen: false);

      if (!productProvider.isLoading && productProvider.allProducts.isEmpty) {
        productProvider.getProducts();
      }
    });
  }
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    if (productProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final lang = AppLocalizations.of(context);

    return Container(
      key: _key,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: Column(
        children: [
          Text(lang!.productRecommended, style: Styles.textH1Medium),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: productProvider.allProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: productProvider.allProducts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
