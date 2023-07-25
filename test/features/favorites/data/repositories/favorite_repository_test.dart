import 'package:desafio_products/features/favorites/data/datasources/favorite_local_datasource.dart';
import 'package:desafio_products/features/favorites/data/repositories/favorite_repository_imp.dart';
import 'package:desafio_products/features/home/data/models/rating_model.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<FavoriteLocalDatasource>()])
import 'favorite_repository_test.mocks.dart';

main() {
  final datasource = MockFavoriteLocalDatasource();
  final repository = FavoriteRepositoryImp(datasource);
  final product = Product(
      isFavorited: false,
      id: 0,
      title: 'test',
      price: 0.9,
      category: 'category',
      description: 'description',
      imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
      rate: RatingModel(
        rate: 1,
        reviews: 120,
      ));

  test('Should return void', () async {
    when(datasource.setFavorite(product)).thenAnswer((realInvocation) async {});

    final result = await repository.setFavorite(product);
    expect(result, isA<void>());
  });
}
