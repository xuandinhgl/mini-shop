class Product {
  final String id;
  final String title;
  final double price;
  final String category;
  final String thumbnail;
  final List<String>? images;
  final String detail;

  Product(
    this.id,
    this.title,
    this.price,
    this.category,
    this.thumbnail,
    this.detail, {
    this.images,
  });
}
