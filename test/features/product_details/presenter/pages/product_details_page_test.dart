import 'package:desafio_products/features/home/data/models/rating_model.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';
import 'package:desafio_products/features/product_details/presenter/pages/product_detail_page.dart';
import 'package:desafio_products/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

main() {
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

  setUp(() async {
    await di.setUp();
  });

  testWidgets('Product Details test', (tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(MaterialApp(
        home: ProductDetailPage(product: product),
      ));
      await tester.pump(const Duration(seconds: 10));

      expect(find.text('Product Details'), findsOneWidget);
      expect(find.widgetWithIcon(IconButton, Icons.favorite), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });
  });
}
