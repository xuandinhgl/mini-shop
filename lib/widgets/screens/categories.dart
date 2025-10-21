import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/widgets/components/category_card.dart';
import 'package:mini_shop/resources/view_models/category_notifier.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final category = ref.watch(categoryNotifierProvider);

    if (category.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    itemCount: category.categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.65,
                    ),
                    itemBuilder: (context, index) {
                      return CategoryCard(category: category.categories[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
