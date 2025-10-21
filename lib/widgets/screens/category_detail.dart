import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/resources/models/category.dart';
import 'package:mini_shop/resources/models/product.dart';
import 'package:mini_shop/resources/view_models/product_notifier.dart';
import 'package:mini_shop/widgets/common/styles.dart';
import 'package:mini_shop/widgets/components/header_cart.dart';
import 'package:mini_shop/widgets/components/product_card.dart';

final categoryInitProvider = FutureProvider.family
    .autoDispose<List<Product>, int>((ref, categoryId) async {
      return await ref.read(productNotifierProvider.notifier).getProductsByCategory(categoryId);
    });

class CategoryDetailScreen extends ConsumerWidget {
  const CategoryDetailScreen({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(categoryInitProvider(category.id));

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        backgroundColor: Styles.colorLightBlue,
        foregroundColor: Colors.white,
        actions: [HeaderCart()],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        child: productAsync.when(
          data: (products) => Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(product: products[index]);
                  },
                ),
              ),
            ],
          ),
          error: (err, _) => Center(child: Text('Error: $err')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
