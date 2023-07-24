import 'package:desafio_products/features/home/domain/entities/product.dart';
import 'package:desafio_products/features/home/domain/usecases/get_all_products.dart';
import 'package:flutter/material.dart';

class HomeController {
  final GetAllProductsUsecase _getAllProductsUsecase;
  HomeController(this._getAllProductsUsecase);

  final ValueNotifier<HomeState> state =
      ValueNotifier<HomeState>(HomeState.loading);

  final ValueNotifier<List<Product>> list = ValueNotifier<List<Product>>([]);

  List<Product> cachedList = <Product>[];

  void getProductList() async {
    state.value = HomeState.loading;
    try {
      final response = await _getAllProductsUsecase();
      response.fold((l) {
        state.value = HomeState.error;
      }, (listResponse) {
        list.value = listResponse;
        cachedList = listResponse;
      });
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }

  void onSearch(String? searchText) async {
    if (searchText != null && searchText.isNotEmpty) {
      List<Product> temp = <Product>[];
      list.value.map((product) {
        if (product.title.toLowerCase().contains(searchText.toLowerCase())) {
          temp.add(product);
        }
      }).toList();
      list.value = temp;
      state.value = HomeState.success;
    } else {
      list.value = cachedList;
      state.value = HomeState.success;
    }
  }
}

enum HomeState { loading, success, error }
