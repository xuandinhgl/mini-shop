import 'package:mini_shop/resources/models/category.dart';

class CategoryState {
  final List<Category> categories;
  final bool isLoading;

  const CategoryState({this.categories = const [], this.isLoading = false});

  CategoryState copyWith({List<Category>? categories, bool? isLoading}) {
    return CategoryState(
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
