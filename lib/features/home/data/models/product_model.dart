import 'dart:convert';

import 'package:desafio_products/features/home/data/models/rating_model.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.category,
    required super.description,
    required super.imageUrl,
    required super.rate,
  });

  ProductModel copyWith({
    int? id,
    String? title,
    double? price,
    String? category,
    String? description,
    String? imageUrl,
    RatingModel? rate,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      rate: rate ?? this.rate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'rate': rate.toMap()
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      price: double.tryParse(map['price'].toString()) ?? 0.0,
      category: map['category'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['image'] ?? '',
      rate: RatingModel.fromMap(map['rating']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, price: $price, category: $category, description: $description, imageUrl: $imageUrl, rating: $rate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.title == title &&
        other.price == price &&
        other.category == category &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.rate == rate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        category.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        rate.hashCode;
  }
}
