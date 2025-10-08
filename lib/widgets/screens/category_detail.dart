import 'package:flutter/material.dart';
import 'package:mini_shop/resources/models/category.dart';
import 'package:mini_shop/resources/view_models/product_provider.dart';
import 'package:mini_shop/widgets/common/styles.dart';
import 'package:mini_shop/widgets/components/header_cart.dart';
import 'package:mini_shop/widgets/components/product_card.dart';
import 'package:provider/provider.dart';

class CategoryDetailScreen extends StatelessWidget {
  final _key = GlobalKey();

  CategoryDetailScreen({super.key, required this.category}){
     WidgetsBinding.instance.addPostFrameCallback((_){
       final context = _key.currentContext;
       if (context == null) {
         return;
       }
       final productProvider = Provider.of<ProductProvider>(context, listen: false);
       if (!productProvider.isLoading) {
         productProvider.getProductsByCategory(category.id);
       }
     });
   }

  final Category category;


  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    if (productProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(category.name),
        backgroundColor: Styles.colorLightBlue,
        foregroundColor: Colors.white,
        actions: [HeaderCart()],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: productProvider.productsByCategory.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: productProvider.productsByCategory[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
