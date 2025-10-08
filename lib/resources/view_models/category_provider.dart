import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mini_shop/resources/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier {
  List<Category> _categories = [];
  bool _isLoading = false;

  get categories => _categories;
  get isLoading => _isLoading;

  Future<void> getCategories() async {
    print("Starting fetch categories");
    _isLoading = true;
    notifyListeners();
    try {
      final res = await http.get(
        Uri.parse("https://api.escuelajs.co/api/v1/categories"),
      );
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final List<dynamic> categoriesList = data;

        _categories = categoriesList.map((item) => Category.fromJson(item)).toList();
      }
    } catch (e) {
      print(e);
    }

    _isLoading = false;
    notifyListeners();
  }
}