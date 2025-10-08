import 'package:flutter/material.dart';
import 'package:mini_shop/resources/apis/product_api.dart';
import 'package:mini_shop/resources/models/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _allProducts = [];
  List<Product> _productsByCategory = [];
  bool _isLoading = false;

  get allProducts => _allProducts;
  get productsByCategory => _productsByCategory;

  get isLoading => _isLoading;

  Future<void> getProducts() async {
    _isLoading = true;
    notifyListeners();

    final res = await ProductApi().getAllProducts();

    if (res != null) {
      _allProducts = res;
    } else {
      _allProducts = [];
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getProductsByCategory(int id) async {
    _isLoading = true;
    notifyListeners();

    final res = await ProductApi().getProductsByCategory(id.toString());

    if (res != null) {
      _productsByCategory = res;
    } else {
      _productsByCategory = [];
    }
    _isLoading = false;
    notifyListeners();
  }

  Product? getProductById(int id) {
    try {
      return _allProducts.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Product> getFavoriteProducts(Set<int> ids) {
    return _allProducts.where((item) => ids.contains(item.id)).toList();
  }
}
