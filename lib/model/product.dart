class Product {
  final String name;
  final String category;
  final double price;
  final double rating;
  final String imagePath;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.imagePath,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      category: json['category'] ?? 'Capacitor',
      price: json['price'],
      rating: json['rating'],
      imagePath: json['image'],
    );
  }
}