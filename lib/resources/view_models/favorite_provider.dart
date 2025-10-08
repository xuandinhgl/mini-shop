import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final Set<int> _productIds = {};

  get favorites => _productIds;

  void toggleFavorite(int productId) {
    if (_productIds.contains(productId)) {
      _productIds.remove(productId);
    } else {
      _productIds.add(productId);
    }

    notifyListeners();
  }

  bool isFavorited(int productId) {
    return _productIds.contains(productId);
  }
}
