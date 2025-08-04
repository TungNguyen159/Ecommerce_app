class ProductModels {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String imageUrl;
  final Rating rating;
  ProductModels({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.rating,
  });
  factory ProductModels.fromJson(Map<String, dynamic> json) {
    return ProductModels(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      imageUrl: json['image'],
      rating: Rating(
        rate: json['rating']['rate'],
        count: json['rating']['count'],
      ),
    );
  }
}

class Rating {
  final double rate;
  final int count;
  Rating({required this.rate, required this.count});
}
