import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mini_shop/l10n/app_localizations.dart';
import 'package:mini_shop/resources/models/cart_item.dart';
import 'package:mini_shop/resources/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/resources/view_models/shoping_cart_state.dart';

final shoppingCartNotifierProvider =
    NotifierProvider<ShoppingCartNotifier, ShoppingCartState>(
      ShoppingCartNotifier.new,
    );

class ShoppingCartNotifier extends Notifier<ShoppingCartState> {
  @override
  ShoppingCartState build() => const ShoppingCartState();

  void addToCart(BuildContext context, Product product) {
    final items = [...state.items];

    final index = items.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      items[index].quantity += 1;
    } else {
      items.add(CartItem(product: product));
    }

    state = state.copyWith(items: items);

    Fluttertoast.showToast(
      msg: AppLocalizations.of(context)!.productAddedToCart,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void increaseQuantity(Product product) {
    final items = [...state.items];
    final index = items.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      items[index].quantity += 1;
    }
    state = state.copyWith(items: items);
  }

  void decreaseQuantity(BuildContext context, Product product) {
    final items = [...state.items];
    final index = items.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      if (items[index].quantity > 1) {
        items[index].quantity -= 1;
      } else {
        items.removeAt(index);
        Fluttertoast.showToast(
          msg: AppLocalizations.of(context)!.productRemovedFromCart,
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } else {
      items.add(CartItem(product: product));
    }
    state = state.copyWith(items: items);
  }

  void clearCart() {
    state = state.copyWith(items: []);
  }
}
