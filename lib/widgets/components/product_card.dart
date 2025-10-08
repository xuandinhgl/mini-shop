import 'package:flutter/material.dart';
import 'package:mini_shop/resources/view_models/shopping_cart_provider.dart';
import 'package:mini_shop/widgets/common/routers.dart';
import 'package:mini_shop/widgets/common/styles.dart';
import 'package:mini_shop/widgets/screens/product_detail.dart';
import 'package:provider/provider.dart';

import '../../resources/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingCartProvider>(
      builder: (context, cart, child) {
        return Container(
          decoration: BoxDecoration(
            color: Styles.colorBlack10,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Image.asset(product.thumbnail),
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
                product.category,
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
                    children: [
                      Text("Unit", style: Styles.textBody1Regular),
                      SizedBox(width: 5),
                      Text(
                        product.price.toString(),
                        style: Styles.textBody1Semibold,
                      ),
                      SizedBox(width: 5),
                      IconButton(
                        onPressed: () {
                          cart.addToCart(product);
                        },
                        icon: Icon(Icons.add),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Styles.colorLightBlue,
                          ),
                          foregroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
