import 'package:desafio_products/app_widget.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setUp();
  runApp(const AppWidget());
}
