import 'package:dartz/dartz.dart';
import 'package:desafio_products/core/errors/failure.dart';
import 'package:desafio_products/features/favorites/domain/repositories/favorite_repository.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';

abstract class GetFavoriteListUsecase {
  Future<Either<Failure, List<Product>>> call();
}

class GetFavoriteListUsecaseImp implements GetFavoriteListUsecase {
  final FavoriteRepository repository;

  GetFavoriteListUsecaseImp(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getFavoriteList();
  }
}
