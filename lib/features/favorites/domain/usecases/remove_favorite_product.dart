import 'package:dartz/dartz.dart';
import 'package:desafio_products/core/errors/failure.dart';
import 'package:desafio_products/features/favorites/domain/repositories/favorite_repository.dart';

abstract class RemoveFavoriteProductUsecase {
  Future<Either<Failure, void>> call(int productId);
}

class RemoveFavoriteProductUsecaseImp implements RemoveFavoriteProductUsecase {
  final FavoriteRepository repository;

  RemoveFavoriteProductUsecaseImp(this.repository);

  @override
  Future<Either<Failure, void>> call(int productId) async {
    return await repository.removeFavorite(productId);
  }
}
