import 'package:desafio_products/features/home/data/datasources/product_remote_datasource.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
import 'product_remote_datasource_test.mocks.dart';

main() {
  final dio = MockDio();
  final datasource = ProductRemoteDatasourceImp(dio);

  test('Should return List<Product>', () async {
    final data = [
      {
        "id": 1,
        "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        "price": 109.95,
        "description":
            "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        "category": "men's clothing",
        "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        "rating": {"rate": 3.9, "count": 120}
      }
    ];
    final httpResponse = Response(requestOptions: RequestOptions(), data: data);
    when(dio.get(any)).thenAnswer((_) async => httpResponse);

    final result = await datasource();
    expect(result, isInstanceOf<List<Product>>());
  });
}
