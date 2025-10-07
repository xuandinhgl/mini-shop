import 'package:flutter/material.dart';
import 'package:mini_shop/resources/view_models/shopping_cart_provider.dart';
import 'package:mini_shop/widgets/common/styles.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingCartProvider>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Shopping cart"),
            backgroundColor: Styles.colorLightBlue,
            foregroundColor: Colors.white,
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: cart.count,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFEBEBFB),
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              cart.items[index].product.image,
                              width: 31,
                              height: 31,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cart.items[index].product.title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(cart.items[index].totalPrice.toString()),
                              ],
                            ),
                            const SizedBox(width: 10),
                            const Spacer(),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    cart.decreaseQuantity(cart.items[index].product);
                                  },
                                  icon: Icon(Icons.remove),
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                      Styles.colorBlack10,
                                    ),
                                    foregroundColor: WidgetStateProperty.all(
                                      Styles.colorBlack90,
                                    ),
                                  ),
                                ),
                                Text(cart.items[index].quantity.toString()),
                                IconButton(
                                  onPressed: () {
                                    cart.increaseQuantity(cart.items[index].product);
                                  },
                                  icon: Icon(Icons.add),
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                      Styles.colorBlack10,
                                    ),
                                    foregroundColor: WidgetStateProperty.all(
                                      Styles.colorBlack90,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Styles.colorBlack10,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Subtotal"),
                          Text(
                              "\$${cart.totalAmound}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery"),
                          Text(
                              "\$10",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total"),
                          Text(
                            "\$${cart.totalAmound + 10}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Styles.colorLightBlue,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 20,
                            right: 10,
                          ),
                          minimumSize: const Size(double.infinity, 48),
                        ),
                        child: Text("Proceed  To checkout"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
