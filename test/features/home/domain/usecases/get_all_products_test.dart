import 'package:dartz/dartz.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';
import 'package:desafio_products/features/home/domain/repositories/products_repository.dart';
import 'package:desafio_products/features/home/domain/usecases/get_all_products.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ProductsRepository>()])
import 'get_all_products_test.mocks.dart';

main() {
  final repository = MockProductsRepository();
  final usecase = GetAllProductsUsecaseImp(repository);
  test('Should return List<Product>', () async {
    when(repository())
        .thenAnswer((realInvocation) async => const Right(<Product>[]));

    final result = await usecase();
    expect(result.fold(id, id), isInstanceOf<List<Product>>());
  });
}
