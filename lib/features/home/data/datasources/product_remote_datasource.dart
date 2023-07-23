import 'dart:convert';

import 'package:desafio_products/features/home/data/constants/home_constants.dart';
import 'package:desafio_products/features/home/data/errors/home_errors.dart';
import 'package:desafio_products/features/home/data/models/product_model.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';
import 'package:dio/dio.dart';

abstract class ProductRemoteDatasource {
  Future<List<Product>> call();
}

class ProductRemoteDatasourceImp implements ProductRemoteDatasource {
  final Dio dio;
  ProductRemoteDatasourceImp(this.dio);
  @override
  Future<List<Product>> call() async {
    try {
      final response = await dio.get(HomeConstants.allProducts);
      final json = jsonDecode(response.data);
      return List.generate(json.length,
          (index) => ProductModel.fromMap(json[index] as Map<String, dynamic>));
    } catch (e) {
      throw HomeServerError();
    }
  }
}
