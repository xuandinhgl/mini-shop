import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/l10n/app_localizations.dart';
import 'package:mini_shop/resources/models/cart_item.dart';
import 'package:mini_shop/resources/view_models/shopping_cart_notifier.dart';
import 'package:mini_shop/widgets/common/styles.dart';

class ShoppingCartScreen extends ConsumerWidget {
  const ShoppingCartScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final cart = ref.watch(shoppingCartNotifierProvider);
    final cartNotifier = ref.watch(shoppingCartNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(lang!.shoppingCart),
        backgroundColor: Styles.colorLightBlue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: cart.count > 0
                  ? ListView.builder(
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
                              CachedNetworkImage(
                                imageUrl: cart.items[index].product.thumbnail,
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.broken_image, size: 50),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cart.items[index].product.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("\$${cart.items[index].totalPrice}"),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Spacer(),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      cartNotifier.decreaseQuantity(
                                        context,
                                        cart.items[index].product,
                                      );
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
                                      cartNotifier.increaseQuantity(
                                        cart.items[index].product,
                                      );
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
                    )
                  : Text(lang.shoppingCartEmpty),
            ),
            const SizedBox(height: 10),
            cart.count > 0
                ? Container(
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
                              "\$${cart.totalAmount}",
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
                              "\$${cart.totalAmount + 10}",
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
                          child: Text("Proceed To checkout"),
                        ),
                      ],
                    ),
                  )
                : Text(""),
          ],
        ),
      ),
    );
  }
}
