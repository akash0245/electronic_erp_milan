class Product {
  final String name;
  final String category;
  final double price;
  final double rating;
  final String imagePath;
  final String description;
  final List<String> productDetail;
  final List<MapEntry<String, dynamic>> lstSpecification;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.imagePath,
    required this.description,
    required this.productDetail,
    required this.lstSpecification,
  });

  factory Product.fromJson(Map<String, dynamic> json) {

    List<MapEntry<String, dynamic>>? specsList;

    if (json['specs'] is Map) {
      final specsMap = json['specs'] as Map;
      specsList = specsMap.entries
          .map((e) => MapEntry<String, dynamic>(e.key.toString(), e.value))
          .toList();
    }

    return Product(
      name: json['name'],
      category: json['category'] ?? 'Electronic',
      price: json['price'],
      rating: json['rating'],
      imagePath: json['image'],
      productDetail : json['productDetail'].cast<String>(),
      description : json['description'],
      lstSpecification: specsList ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'rating': rating,
      'image': imagePath,
      'productDetail': productDetail,
      'description': description,
      'specs': lstSpecification.fold<Map<String, dynamic>>(
        {},
            (map, entry) => map..[entry.key] = entry.value,
      ),
    };
  }
}