import 'package:mini_shop/resources/models/product.dart';

class ProductState {
  final List<Product> allProducts;
  final bool isLoading;

  const ProductState({this.allProducts = const [], this.isLoading = false});

  ProductState copyWith({List<Product>? allProducts, bool? isLoading}) {
    return ProductState(
      allProducts: allProducts ?? this.allProducts,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
