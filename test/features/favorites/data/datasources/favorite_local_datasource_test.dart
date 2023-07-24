import 'package:desafio_products/features/home/data/models/rating_model.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../repositories/favorite_repository_test.mocks.dart';

main() async {
  final datasource = MockFavoriteLocalDatasource();
  final product = Product(
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

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
  });

  test('Should return List<Product>', () async {
    when(datasource.getFavoriteList())
        .thenAnswer((realInvocation) async => <Product>[]);
    final result = await datasource.getFavoriteList();
    expect(result, isInstanceOf<List<Product>>());
  });

  test('Should return void', () async {
    when(datasource.setFavorite(product)).thenAnswer((realInvocation) async {});
    final result = await datasource.getFavoriteList();
    expect(result, isA<void>());
  });

  test('Should return void', () async {
    when(datasource.setFavorite(product)).thenAnswer((realInvocation) async {});
    final result = await datasource.getFavoriteList();
    expect(result, isA<void>());
  });
}
