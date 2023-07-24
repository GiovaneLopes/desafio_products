import 'package:desafio_products/core/platform/network_info.dart';
import 'package:desafio_products/features/home/data/datasources/product_remote_datasource.dart';
import 'package:desafio_products/features/home/data/repositories/product_repository_imp.dart';
import 'package:desafio_products/features/home/domain/usecases/get_all_products.dart';
import 'package:desafio_products/features/home/presenter/home_controller.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final getIt = GetIt.instance;

setUp() {
  //Core
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerLazySingleton(
      () => NetworkInfoImp(getIt<InternetConnectionChecker>()));
  getIt.registerLazySingleton(() => Dio());

  //Controllers
  getIt.registerLazySingleton<HomeController>(
      () => HomeController(getIt<GetAllProductsUsecaseImp>()));

  //Usecases
  getIt.registerLazySingleton<GetAllProductsUsecaseImp>(
      () => GetAllProductsUsecaseImp(getIt<ProductRepositoryImp>()));

  //Repositories
  getIt.registerLazySingleton(() => ProductRepositoryImp(
      getIt<ProductRemoteDatasourceImp>(), getIt<NetworkInfoImp>()));

  //Datasources
  getIt.registerLazySingleton(() => ProductRemoteDatasourceImp(getIt<Dio>()));
}
