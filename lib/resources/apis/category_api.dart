import 'package:mini_shop/resources/apis/base_api.dart';
import 'package:mini_shop/resources/models/category.dart';

class CategoryApi extends BaseApi {
  Future<List<Category>?> getCategories() async {
    super.url = 'categories';
    final response = await super.get();
    if (response != null && response.isList && response.list != null) {
      return response.list!.map((item) => Category.fromJson(item)).toList();
    } else {
      return null;
    }
  }

  Future<Category?> getCategory(String id) async {
    super.url = "categories/$id";
    final response = await super.get();
    if (response != null && response.isMap && response.map != null) {
      return Category.fromJson(response.map!);
    } else {
      return null;
    }
  }
}
