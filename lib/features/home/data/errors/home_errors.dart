import 'package:desafio_products/core/errors/failure.dart';

class HomeServerError extends Failure {
  HomeServerError()
      : super(errorMessage: 'Houve um problema com a sua requisição.');
}
