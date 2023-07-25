import 'dart:convert';
import 'package:desafio_products/features/favorites/data/constants/favorite_contants.dart';
import 'package:desafio_products/features/favorites/data/errors/favorite_errors.dart';
import 'package:desafio_products/features/home/data/models/product_model.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FavoriteLocalDatasource {
  Future<void> setFavorite(Product product);
  Future<List<Product>> getFavoriteList();
}

class FavoriteLocalDatasourceImp implements FavoriteLocalDatasource {
  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  FavoriteLocalDatasourceImp();

  @override
  Future<void> setFavorite(Product product) async {
    try {
      final prefs = await preferences;
      final List<Product> favorites = await getFavoriteList();
      if (favorites.isEmpty) {
        await prefs.setString(
            FavoriteConstants.favorite, jsonEncode([product]));
      } else {
        bool isUpdated = false;
        for (int i = 0; i < favorites.length; i++) {
          if (favorites[i].id == product.id) {
            isUpdated = true;
            favorites[i] = product;
          }
        }
        if (!isUpdated) {
          favorites.add(product);
        }
        await prefs.setString(
            FavoriteConstants.favorite, jsonEncode(favorites));
      }
    } catch (e) {
      throw FavoriteError();
    }
  }

  @override
  Future<List<Product>> getFavoriteList() async {
    try {
      final prefs = await preferences;
      final String? jsonList = prefs.getString(FavoriteConstants.favorite);
      List<Product> favoriteList = <Product>[];
      if (jsonList != null) {
        final map = jsonDecode(jsonList);
        map.map((product) {
          if (product is String) {
            final local = ProductModel.fromJson(product);
            if (local.isFavorited) {
              favoriteList.add(local);
            }
          }
        }).toList();
        return favoriteList;
      } else {
        return favoriteList;
      }
    } catch (e) {
      throw FavoriteError();
    }
  }
}
