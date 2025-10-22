import 'package:mini_shop/resources/apis/category_api.dart';
import 'package:mini_shop/resources/models/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/resources/view_models/category_state.dart';

final categoryNotifierProvider =
    NotifierProvider<CategoryNotifier, CategoryState>(CategoryNotifier.new);

class CategoryNotifier extends Notifier<CategoryState> {
  @override
  CategoryState build() {
    Future.microtask(() => _getCategories());
    return CategoryState();
  }

  Future<void> _getCategories() async {
    state = state.copyWith(isLoading: true);
    final res = await CategoryApi().getCategories();
    state = state.copyWith(isLoading: false, categories: res ?? []);
  }

  Future<Category?> getCategory(String id) async {
    return await CategoryApi().getCategory(id);
  }
}
