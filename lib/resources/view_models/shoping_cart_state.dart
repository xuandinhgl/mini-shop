import 'package:mini_shop/resources/models/cart_item.dart';

class ShoppingCartState {
  final List<CartItem> items;

  const ShoppingCartState({this.items = const []});

  double get totalAmount => items.fold(0, (sum, item) => sum + item.totalPrice);
  int get count => items.length;

  ShoppingCartState copyWith({List<CartItem>? items}) =>
      ShoppingCartState(items: items ?? this.items);
}
