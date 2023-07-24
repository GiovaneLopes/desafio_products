import 'dart:convert';
import 'package:desafio_products/features/favorites/data/errors/favorite_errors.dart';
import 'package:desafio_products/features/home/data/models/product_model.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FavoriteLocalDatasource {
  Future<void> setFavorite(Product product);
  Future<void> removeFavorite(int productId);
  Future<List<Product>> getFavoriteList();
}

class FavoriteLocalDatasourceImp implements FavoriteLocalDatasource {
  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  FavoriteLocalDatasourceImp();

  @override
  Future<void> setFavorite(Product product) async {
    try {
      final prefs = await preferences;
      final cachedFavoriteList = prefs.getString('favorites');
      if (cachedFavoriteList != null) {
        final favoriteList = jsonDecode(cachedFavoriteList) as List;
        final newList = <Product>[];
        for (var element in favoriteList) {
          newList.add(ProductModel.fromMap(element as Map<String, dynamic>));
        }
        newList.add(product);
        prefs.setString('favorites', jsonEncode(newList));
      } else {
        prefs.setString('favorites', jsonEncode([product]));
      }
    } catch (e) {
      debugPrint('### e: $e');
      throw FavoriteError();
    }
  }

  @override
  Future<List<Product>> getFavoriteList() async {
    try {
      final prefs = await preferences;
      final cachedFavoriteList = prefs.getString('favorites');
      if (cachedFavoriteList != null) {
        final mapList = jsonDecode(cachedFavoriteList) as List;
        final favoriteList = <Product>[];
        for (var element in mapList) {
          favoriteList
              .add(ProductModel.fromMap(element as Map<String, dynamic>));
        }

        return favoriteList;
      } else {
        return <Product>[];
      }
    } catch (e) {
      throw FavoriteError();
    }
  }

  @override
  Future<void> removeFavorite(int productId) async {
    try {
      final prefs = await preferences;
      final cachedFavoriteList = prefs.getString('favorites');
      if (cachedFavoriteList != null) {
        final favoriteList = jsonDecode(cachedFavoriteList) as List;
        final newList = <Product>[];
        for (var element in favoriteList) {
          final localProduct =
              ProductModel.fromMap(element as Map<String, dynamic>);
          if (localProduct.id != productId) {
            newList.add(localProduct);
          }
        }
        prefs.setString('favorites', jsonEncode(newList));
      }
    } catch (e) {
      throw FavoriteError();
    }
  }
}
