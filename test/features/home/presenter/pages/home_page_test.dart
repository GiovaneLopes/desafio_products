import 'package:desafio_products/features/home/presenter/pages/home_page.dart';
import 'package:desafio_products/features/home/presenter/widgets/search_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:desafio_products/injection_container.dart' as di;

// @GenerateNiceMocks([MockSpec<HomeController>()])
// import 'home_page_test.mocks.dart';

main() async {
  setUp(() async {
    await di.setUp();
  });
  group('Home Page test', () {
    testWidgets('Home Page - Title Desafio Products', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      await tester.pump(const Duration(seconds: 10));

      expect(find.text("Products"), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.widgetWithIcon(AppBar, Icons.favorite_border_outlined),
          findsOneWidget);
      expect(find.byType(SearchTextFormField), findsOneWidget);
    });
  });
}
