import 'package:dartz/dartz.dart';
import 'package:desafio_products/core/errors/failure.dart';
import 'package:desafio_products/core/platform/network_info.dart';
import 'package:desafio_products/features/favorites/data/datasources/favorite_local_datasource.dart';
import 'package:desafio_products/features/home/data/datasources/product_remote_datasource.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';
import 'package:desafio_products/features/home/domain/repositories/products_repository.dart';

class ProductRepositoryImp implements ProductsRepository {
  final ProductRemoteDatasource datasource;
  final FavoriteLocalDatasource favoriteDatasource;
  final NetworkInfo networkInfo;

  ProductRepositoryImp(
      this.datasource, this.networkInfo, this.favoriteDatasource);

  @override
  Future<Either<Failure, List<Product>>> call() async {
    try {
      if (await networkInfo.isConnected) {
        final result = await datasource();
        final favorites = await favoriteDatasource.getFavoriteList();
        for (int i = 0; i < result.length; i++) {
          favorites.map((favorite) {
            if (favorite.id == result[i].id) {
              result[i] = result[i].copyWith(isFavorited: true);
            }
          }).toList();
        }
        return Right(result);
      } else {
        return Left(NoInternetConnectionFailure());
      }
    } catch (e) {
      rethrow;
    }
  }
}
