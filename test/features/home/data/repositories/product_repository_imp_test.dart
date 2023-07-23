import 'package:dartz/dartz.dart';
import 'package:desafio_products/core/errors/failure.dart';
import 'package:desafio_products/core/platform/network_info.dart';
import 'package:desafio_products/features/home/data/datasources/product_remote_datasource.dart';
import 'package:desafio_products/features/home/data/repositories/product_repository_imp.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks(
    [MockSpec<ProductRemoteDatasource>(), MockSpec<NetworkInfo>()])
import 'product_repository_imp_test.mocks.dart';

main() {
  final datasource = MockProductRemoteDatasource();
  final networkInfo = MockNetworkInfo();
  final repository = ProductRepositoryImp(datasource, networkInfo);

  test('Should return List<Product>', () async {
    when(networkInfo.isConnected).thenAnswer((_) async => true);
    when(datasource()).thenAnswer((_) async => <Product>[]);
    final result = await repository();
    expect(result.fold(id, id), isInstanceOf<List<Product>>());
  });

  test('Should return NoInternetConnectionFailure', () async {
    when(networkInfo.isConnected).thenAnswer((_) async => false);
    when(datasource()).thenAnswer((_) async => <Product>[]);
    final result = await repository();
    expect(result.fold(id, id), isInstanceOf<NoInternetConnectionFailure>());
  });
}
