import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mini_shop/resources/models/product.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  List<Product> _allProducts = [];
  List<Product> _productsByCategory = [];
  List<Product> _favoriteProducts = [];
  bool _isLoading = false;
  String? _errorMessage;

  bool _isFetched = false;
  bool get isFetched => _isFetched;

  get allProducts => _allProducts;
  get productsByCategory => _productsByCategory;

  get isLoading => _isLoading;
  get errorMessage => _errorMessage;

  Future<void> getProducts() async {
    if (_isFetched) return;
    _isFetched = true;

    _isLoading = true;
    notifyListeners();

    try {
      final res = await http.get(
        Uri.parse("https://api.escuelajs.co/api/v1/products"),
      );
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);

        _allProducts = data.map((item) => Product.fromJson(item)).toList();
        _errorMessage = null;
      }
    } catch (e) {
      print(e);
      _errorMessage = "$e";
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> getProductsByCategory(int id) async {
    print("getProductsByCategory ");
    _isLoading = true;
    notifyListeners();

    try {
      final res = await http.get(
        Uri.parse("https://api.escuelajs.co/api/v1/products?categoryId=$id"),
      );
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        _productsByCategory = data
            .map((item) => Product.fromJson(item))
            .toList();
        _errorMessage = null;
      }
    } catch (e) {
      print(e);
      _errorMessage = "$e";
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
