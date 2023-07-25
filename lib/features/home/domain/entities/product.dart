import 'package:desafio_products/features/home/data/models/rating_model.dart';

class Product {
  int id;
  String title;
  double price;
  String category;
  String description;
  String imageUrl;
  RatingModel rate;
  bool isFavorited;
  Product({
    required this.isFavorited,
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.rate,
  });

  Product copyWith({
    int? id,
    String? title,
    double? price,
    String? category,
    String? description,
    String? imageUrl,
    RatingModel? rate,
    bool? isFavorited,
  }) {
    return Product(
      isFavorited: isFavorited ?? this.isFavorited,
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      rate: rate ?? this.rate,
    );
  }
}
