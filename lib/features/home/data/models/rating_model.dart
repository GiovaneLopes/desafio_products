import 'dart:convert';

import 'package:desafio_products/features/home/domain/entities/rating.dart';

class RatingModel extends Rating {
  RatingModel({
    required super.rate,
    required super.reviews,
  });

  RatingModel copyWith({
    double? rate,
    int? reviews,
  }) {
    return RatingModel(
      rate: rate ?? this.rate,
      reviews: reviews ?? this.reviews,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rate': rate,
      'count': reviews,
    };
  }

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(
      rate: map['rate']?.toDouble() ?? 0.0,
      reviews: map['count']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingModel.fromJson(String source) =>
      RatingModel.fromMap(json.decode(source));

  @override
  String toString() => 'RatingModel(rate: $rate, reviews: $reviews)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RatingModel &&
        other.rate == rate &&
        other.reviews == reviews;
  }

  @override
  int get hashCode => rate.hashCode ^ reviews.hashCode;
}
