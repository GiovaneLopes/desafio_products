import 'package:desafio_products/core/ui/product_card.dart';
import 'package:desafio_products/features/favorites/presenter/favorite_controller.dart';
import 'package:desafio_products/features/home/presenter/pages/home_error_page.dart';
import 'package:desafio_products/features/product_details/presenter/pages/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final controller = GetIt.I<FavoriteController>();

  @override
  void initState() {
    super.initState();
    controller.getFavoriteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Favorites',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 22, left: 22, right: 22),
        child: ValueListenableBuilder<FavoritesState>(
            valueListenable: controller.state,
            builder: (context, state, w) {
              if (state == FavoritesState.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state == FavoritesState.error) {
                Future.microtask(
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeErrorPage(),
                    ),
                  ),
                );
              }
              return SingleChildScrollView(
                child: Column(
                  children: controller.list.value.map((favorite) {
                    return ProductCard(
                      product: favorite,
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                              product: favorite,
                            ),
                          ),
                        ).then((value) async =>
                            await controller.getFavoriteList());
                        setState(() {});
                      },
                    );
                  }).toList(),
                ),
              );
            }),
      ),
    );
  }
}
