import 'package:flutter/material.dart';
import 'package:mini_shop/resources/models/cart_item.dart';
import 'package:mini_shop/resources/models/product.dart';
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
          body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.count,
                    itemBuilder: (context, index) {
                      return _ItemRow(cartItem: cart.items[index],);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                _SubTotal(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SubTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ShoppingCartProvider>(context, listen: false);
    return Container(
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
              Text("\$10", style: TextStyle(fontWeight: FontWeight.bold)),
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
            child: Text("Proceed To checkout"),
          ),
        ],
      ),
    );
  }
}

class _ItemRow extends StatelessWidget{
  final CartItem cartItem;
  const _ItemRow({ required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ShoppingCartProvider>(context, listen: false);
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
          Image.network(
            cartItem.product.thumbnail,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("\$${cartItem.totalPrice}"),
              ],
            ),
          ),
          const SizedBox(width: 10),
          const Spacer(),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  cart.decreaseQuantity(
                    cartItem.product,
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
              Text(cartItem.quantity.toString()),
              IconButton(
                onPressed: () {
                  cart.increaseQuantity(
                    cartItem.product,
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
  }

}