import 'package:dartz/dartz.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<Either<Exception, List<Product>>> call();
}
