import 'package:flutter/material.dart';
import 'package:mini_shop/resources/models/cart_item.dart';
import 'package:mini_shop/resources/models/product.dart';

class ShoppingCartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get count => items.length;

  double get totalAmound =>
      _items.fold(0, (sum, item) => sum + item.totalPrice);

  void addToCart(Product product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _items[index].quantity += 1;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void increaseQuantity(Product product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _items[index].quantity += 1;
    }
    notifyListeners();
  }

  void decreaseQuantity(Product product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity -= 1;
      } else {
        _items.removeAt(index);
      }
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
