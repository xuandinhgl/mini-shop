import 'package:mini_shop/resources/apis/product_api.dart';
import 'package:mini_shop/resources/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/resources/view_models/product_state.dart';

final productNotifierProvider = NotifierProvider<ProductNotifier, ProductState>(
  ProductNotifier.new,
);

class ProductNotifier extends Notifier<ProductState> {
  @override
  ProductState build() {
    Future.microtask(() => _getAllProducts());
    return ProductState();
  }

  Future<void> _getAllProducts() async {
    state = state.copyWith(isLoading: true);
    final res = await ProductApi().getAllProducts();
    state = state.copyWith(isLoading: false, allProducts: res ?? []);
  }

  Future<List<Product>> getProductsByCategory(String id) async {
    final res = await ProductApi().getProductsByCategory(id);
    return res ?? [];
  }

  Future<Product?> getProductById(String id) async {
    return await ProductApi().getProduct(id);
  }

  List<Product> getFavoriteProducts(Set<int> ids) {
    return state.allProducts.where((item) => ids.contains(item.id)).toList();
  }
}
