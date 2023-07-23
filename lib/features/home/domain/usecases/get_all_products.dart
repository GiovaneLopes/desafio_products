import 'package:dartz/dartz.dart';
import 'package:desafio_products/core/errors/failure.dart';

import 'package:desafio_products/features/home/domain/entities/product.dart';
import 'package:desafio_products/features/home/domain/repositories/products_repository.dart';

abstract class GetAllProductsUsecase {
  Future<Either<Failure, List<Product>>> call();
}

class GetAllProductsUsecaseImp implements GetAllProductsUsecase {
  final ProductsRepository repository;

  GetAllProductsUsecaseImp(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call() async {
    return await repository();
  }
}
