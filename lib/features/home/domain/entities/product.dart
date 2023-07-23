import 'package:desafio_products/features/home/data/models/rating_model.dart';

class Product {
  int id;
  String title;
  double price;
  String category;
  String description;
  String imageUrl;
  RatingModel rate;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.rate,
  });
}
