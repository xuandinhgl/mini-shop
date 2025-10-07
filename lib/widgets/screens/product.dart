import 'package:flutter/material.dart';
import 'package:mini_shop/resources/constants.dart';
import 'package:mini_shop/widgets/common/styles.dart';
import 'package:mini_shop/widgets/components/product_card.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: Column(
        children: [
          const Text("Recommended", style: Styles.textH1Medium),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: Constants.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: Constants.products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
