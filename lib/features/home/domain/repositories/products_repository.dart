import 'package:dartz/dartz.dart';
import 'package:desafio_products/core/errors/failure.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> call();
}
