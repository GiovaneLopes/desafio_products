import 'package:dartz/dartz.dart';
import 'package:desafio_products/features/favorites/domain/repositories/favorite_repository.dart';
import 'package:desafio_products/features/favorites/domain/usecases/set_favorite_product.dart';
import 'package:desafio_products/features/home/data/models/rating_model.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<FavoriteRepository>()])
import 'set_favorite_product_test.mocks.dart';

main() {
  final repository = MockFavoriteRepository();
  final usecase = SetFavoriteProdutUsecaseImp(repository);
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
    when(repository.setFavorite(any))
        .thenAnswer((_) async => const Right(null));
    final result = await usecase(product);
    expect(result, isA<void>());
  });
}
