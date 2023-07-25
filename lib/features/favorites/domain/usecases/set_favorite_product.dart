import 'package:dartz/dartz.dart';
import 'package:desafio_products/core/errors/failure.dart';
import 'package:desafio_products/features/favorites/domain/repositories/favorite_repository.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';

abstract class SetFavoriteProdutUsecase {
  Future<Either<Failure, void>> call(Product product);
}

class SetFavoriteProdutUsecaseImp implements SetFavoriteProdutUsecase {
  final FavoriteRepository repository;

  SetFavoriteProdutUsecaseImp(this.repository);
  @override
  Future<Either<Failure, void>> call(Product product) async {
    return await repository.setFavorite(product);
  }
}
