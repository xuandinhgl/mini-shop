import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<String> _products = [];

  get favorites => _products;

  void toggleFavorite(String productId) {
    final int indexed = _products.indexWhere((item) => item == productId);
    if (indexed >= 0) {
      _products.removeAt(indexed);
    } else {
      _products.add(productId);
    }

    notifyListeners();
  }

  bool isFavorited(String productId) {
    return _products.contains(productId);
  }
}
