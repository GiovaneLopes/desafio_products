import 'package:dartz/dartz.dart';
import 'package:desafio_products/core/errors/failure.dart';
import 'package:desafio_products/core/platform/network_info.dart';
import 'package:desafio_products/features/home/data/datasources/product_remote_datasource.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';
import 'package:desafio_products/features/home/domain/repositories/products_repository.dart';

class ProductRepositoryImp implements ProductsRepository {
  final ProductRemoteDatasource datasource;
  final NetworkInfo networkInfo;

  ProductRepositoryImp(this.datasource, this.networkInfo);

  @override
  Future<Either<Failure, List<Product>>> call() async {
    try {
      if (await networkInfo.isConnected) {
        final result = await datasource();
        return Right(result);
      } else {
        return Left(NoInternetConnectionFailure());
      }
    } catch (e) {
      rethrow;
    }
  }
}
