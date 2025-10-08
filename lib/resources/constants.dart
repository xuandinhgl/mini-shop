
import 'package:mini_shop/resources/models/category.dart';
import 'package:mini_shop/resources/models/product.dart';

class Constants {
  static List<Product> products = [
    Product( "1","iPhone 17 Pro Max 256GB", 200, "Mobile", "images/iphone_17_pro.png", "lorem"),
    Product( "2","iPhone Air 256GB", 150, "Mobile", "images/iphone_air.png", "lorem"),
    Product( "3","iPhone 17 256GB", 160, "Mobile", "images/iphone_17.png", "lorem"),
    Product( "4","iPad A16 WiFi 128GB", 180, "Mobile", "images/ipad_a16.png", "lorem"),
  ];
  static List<Category> categories = [
    Category("Mobile", "images/iphone_17_pro.png", ""),
    Category("Laptop", "images/laptop.png", ""),
    Category("Watches", "images/watch.png", ""),
    Category("PC", "images/pc.png", ""),
  ];
}