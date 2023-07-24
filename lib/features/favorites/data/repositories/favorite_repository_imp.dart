import 'package:dartz/dartz.dart';
import 'package:desafio_products/core/errors/failure.dart';
import 'package:desafio_products/features/favorites/data/datasources/favorite_local_datasource.dart';
import 'package:desafio_products/features/favorites/domain/repositories/favorite_repository.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';

class FavoriteRepositoryImp implements FavoriteRepository {
  final FavoriteLocalDatasource datasource;

  FavoriteRepositoryImp(this.datasource);
  @override
  Future<Either<Failure, void>> setFavorite(Product product) async {
    try {
      await datasource.setFavorite(product);
      return const Right(null);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, void>> removeFavorite(int productId) async {
    try {
      await datasource.removeFavorite(productId);
      return const Right(null);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getFavoriteList() async {
    try {
      final response = await datasource.getFavoriteList();
      return Right(response);
    } catch (e) {
      rethrow;
    }
  }
}
