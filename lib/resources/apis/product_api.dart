import 'package:mini_shop/resources/apis/base_api.dart';
import 'package:mini_shop/resources/models/product.dart';

class ProductApi extends BaseApi {
  Future<List<Product>?> getAllProducts() async {
    super.url = 'products';

    final response = await super.get();
    if (response != null) {
      return response.map((item) => Product.fromJson(item)).toList();
    } else {
      return null;
    }
  }

  Future<List<Product>?> getProductsByCategory(String categoryId) async {
    super.url = 'products';
    super.parameters.putIfAbsent("categoryId", () => categoryId);
    final response = await super.get();
    if (response != null) {
      return response.map((item) => Product.fromJson(item)).toList();
    } else {
      return null;
    }
  }
}
