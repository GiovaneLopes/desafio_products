import 'package:desafio_products/features/favorites/domain/usecases/get_favorite_list.dart';
import 'package:desafio_products/features/favorites/domain/usecases/set_favorite_product.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';
import 'package:flutter/material.dart';

class FavoriteController {
  final GetFavoriteListUsecase _getFavoriteListUsecase;
  final SetFavoriteProdutUsecase _setFavoriteProdutUsecase;
  FavoriteController(
      this._getFavoriteListUsecase, this._setFavoriteProdutUsecase);

  final ValueNotifier<FavoritesState> state =
      ValueNotifier<FavoritesState>(FavoritesState.loading);

  final ValueNotifier<List<Product>> list = ValueNotifier<List<Product>>([]);

  Future<void> getFavoriteList() async {
    final response = await _getFavoriteListUsecase();
    response.fold((l) => state.value = FavoritesState.error, (favoriteList) {
      state.value = FavoritesState.success;
      list.value = favoriteList;
    });
  }

  Future<void> setFavoriteProduct(Product product) async {
    final response = await _setFavoriteProdutUsecase(product);
    response.fold(
        (l) => state.value = FavoritesState.error, (r) => getFavoriteList());
  }
}

enum FavoritesState { loading, success, error }
