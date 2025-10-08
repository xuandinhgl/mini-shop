import 'package:flutter/material.dart';
import 'package:mini_shop/resources/view_models/category_provider.dart';
import 'package:mini_shop/widgets/components/category_card.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key}) {
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      final context = _key.currentContext;
      if (context == null) {
        return;
      }
      final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
      if (!categoryProvider.isLoading && categoryProvider.categories.isEmpty) {
        categoryProvider.getCategories();
      }
    });
  }

  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    if (categoryProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      key: _key,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    itemCount: categoryProvider.categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.65,
                    ),
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        category: categoryProvider.categories[index],
                      );
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
