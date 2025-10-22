import 'package:mini_shop/resources/apis/base_api.dart';
import 'package:mini_shop/resources/models/product.dart';

class ProductApi extends BaseApi {
  Future<List<Product>?> getAllProducts() async {
    super.url = 'products';

    final response = await super.get();
    if (response != null && response.isList && response.list != null) {
      return response.list!.map((item) => Product.fromJson(item)).toList();
    }

    return null;
  }

  Future<List<Product>?> getProductsByCategory(String categoryId) async {
    super.url = 'products';
    super.parameters.putIfAbsent("categoryId", () => categoryId);
    final response = await super.get();
    if (response != null && response.isList && response.list != null) {
      return response.list!.map((item) => Product.fromJson(item)).toList();
    }

    return null;
  }

  Future<Product?> getProduct(String productId) async {
    super.url = 'products/$productId';
    final response = await super.get();
    if (response != null && response.isMap && response.map != null) {
      return Product.fromJson(response.map!);
    }

    return null;
  }
}
