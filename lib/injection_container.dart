import 'package:desafio_products/core/platform/network_info.dart';
import 'package:desafio_products/features/favorites/data/datasources/favorite_local_datasource.dart';
import 'package:desafio_products/features/favorites/data/repositories/favorite_repository_imp.dart';
import 'package:desafio_products/features/favorites/domain/usecases/get_favorite_list.dart';
import 'package:desafio_products/features/favorites/domain/usecases/set_favorite_product.dart';
import 'package:desafio_products/features/favorites/presenter/favorite_controller.dart';
import 'package:desafio_products/features/home/data/datasources/product_remote_datasource.dart';
import 'package:desafio_products/features/home/data/repositories/product_repository_imp.dart';
import 'package:desafio_products/features/home/domain/usecases/get_all_products.dart';
import 'package:desafio_products/features/home/presenter/home_controller.dart';
import 'package:desafio_products/features/product_details/presenter/product_details_controller.dart';
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
  getIt.registerLazySingleton<ProductDetailsController>(
      () => ProductDetailsController());
  getIt.registerLazySingleton<FavoriteController>(() => FavoriteController(
      getIt<GetFavoriteListUsecaseImp>(),
      getIt<SetFavoriteProdutUsecaseImp>()));

  //Usecases
  getIt.registerLazySingleton<GetAllProductsUsecaseImp>(
      () => GetAllProductsUsecaseImp(getIt<ProductRepositoryImp>()));
  getIt.registerLazySingleton<GetFavoriteListUsecaseImp>(
      () => GetFavoriteListUsecaseImp(getIt<FavoriteRepositoryImp>()));
  getIt.registerLazySingleton<SetFavoriteProdutUsecaseImp>(
      () => SetFavoriteProdutUsecaseImp(getIt<FavoriteRepositoryImp>()));

  //Repositories
  getIt.registerLazySingleton(() => ProductRepositoryImp(
      getIt<ProductRemoteDatasourceImp>(),
      getIt<NetworkInfoImp>(),
      getIt<FavoriteLocalDatasourceImp>()));
  getIt.registerLazySingleton(
      () => FavoriteRepositoryImp(getIt<FavoriteLocalDatasourceImp>()));

  //Datasources
  getIt.registerLazySingleton(() => ProductRemoteDatasourceImp(getIt<Dio>()));
  getIt.registerLazySingleton(() => FavoriteLocalDatasourceImp());
}
