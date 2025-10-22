import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/resources/models/category.dart';
import 'package:mini_shop/resources/models/product.dart';
import 'package:mini_shop/resources/view_models/category_notifier.dart';
import 'package:mini_shop/resources/view_models/product_notifier.dart';
import 'package:mini_shop/widgets/common/styles.dart';
import 'package:mini_shop/widgets/components/header_cart.dart';
import 'package:mini_shop/widgets/components/product_card.dart';

final productsInitProvider = FutureProvider.family
    .autoDispose<List<Product>, String>((ref, categoryId) async {
      return await ref
          .read(productNotifierProvider.notifier)
          .getProductsByCategory(categoryId);
    });

final categoryInitProvider = FutureProvider.family
    .autoDispose<Category?, String>((ref, id) async {
      return await ref.read(categoryNotifierProvider.notifier).getCategory(id);
    });

class CategoryDetailScreen extends ConsumerWidget {
  const CategoryDetailScreen({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productsInitProvider(categoryId));
    final categoryAsync = ref.watch(categoryInitProvider(categoryId));

    return Scaffold(
      appBar: AppBar(
        title: categoryAsync.when(
          data: (category) => Text(category?.name ?? ""),
          error: (err, _) => Center(child: Text('Error: $err')),
          loading: () => const Text("Category"),
        ),
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
