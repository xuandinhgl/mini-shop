import 'package:flutter/material.dart';
import 'package:mini_shop/resources/apis/category_api.dart';
import 'package:mini_shop/resources/models/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider = ChangeNotifierProvider<CategoryProvider>((ref) => CategoryProvider());

class CategoryProvider extends ChangeNotifier {
  List<Category> _categories = [];
  bool _isLoading = false;

  get categories => _categories;
  get isLoading => _isLoading;

  Future<void> getCategories() async {
    _isLoading = true;
    notifyListeners();

    final res = await CategoryApi().getCategories();
    if (res != null) {
      _categories = res;
    } else {
      _categories = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
