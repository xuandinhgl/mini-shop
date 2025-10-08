import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FavoriteProvider extends ChangeNotifier {
  final Set<int> _productIds = {};

  get favorites => _productIds;

  void toggleFavorite(int productId) {
    if (_productIds.contains(productId)) {
      _productIds.remove(productId);
      Fluttertoast.showToast(
        msg: "Product removed from favorite",
        toastLength: Toast.LENGTH_SHORT,
      );
    } else {
      _productIds.add(productId);
      Fluttertoast.showToast(
        msg: "Product added to favorite",
        toastLength: Toast.LENGTH_SHORT,
      );
    }

    notifyListeners();
  }

  bool isFavorited(int productId) {
    return _productIds.contains(productId);
  }
}
