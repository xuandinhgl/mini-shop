import 'package:mini_shop/resources/models/category.dart';

class Product {
  final int id;
  final String title;
  final int price;
  final Category category;
  final List<String> images;
  final String description;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.images,
  });

  String get thumbnail => images.isNotEmpty ? images.first : '';

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? 0,
      price: json['price'] ?? 0,
      category: Category.fromJson(json['category']),
      description: json['description'] ?? "",
      images: (json['images'] is List)
          ? (json['images'] as List).map((e) => e.toString()).toList()
          : [],
    );
  }
}
