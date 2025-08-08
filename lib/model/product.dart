class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final double rating;
  final String imagePath;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.imagePath,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      imagePath: json['imagePath'],
    );
  }
}