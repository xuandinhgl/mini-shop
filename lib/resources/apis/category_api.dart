import 'package:mini_shop/resources/apis/base_api.dart';
import 'package:mini_shop/resources/models/category.dart';

class CategoryApi extends BaseApi {
  Future<List<Category>?> getCategories() async {
    super.url = 'categories';
    final response = await super.get();
    if (response!= null && response.isList && response.list != null) {
      return response.list!.map((item) => Category.fromJson(item)).toList();
    } else {
      return null;
    }
  }
}