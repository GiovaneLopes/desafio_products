import 'package:desafio_products/core/resources/images.dart';
import 'package:desafio_products/core/ui/product_card.dart';
import 'package:desafio_products/features/home/presenter/home_controller.dart';
import 'package:desafio_products/features/home/presenter/pages/home_error_page.dart';
import 'package:desafio_products/features/home/presenter/widgets/search_text_form_field.dart';
import 'package:desafio_products/features/product_details/presenter/pages/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  final controller = GetIt.I<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.getProductList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Products',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border_outlined,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 22, right: 22),
            child: SizedBox(
              height: 52,
              child: SearchTextFormField(
                onChanged: (value) {
                  controller.onSearch(value);
                  setState(() {});
                },
                controller: searchController,
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<HomeState>(
              valueListenable: controller.state,
              builder: (context, state, w) {
                if (state == HomeState.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state == HomeState.error) {
                  Future.microtask(
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeErrorPage(),
                      ),
                    ).then(
                      (value) => controller.getProductList(),
                    ),
                  );
                }
                if (controller.list.value.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Images.emptyListIllustration,
                        ),
                        Text(
                          'The list is empty',
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      children: controller.list.value
                          .map(
                            (product) => ProductCard(
                              product: product,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailPage(
                                      product: product,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                          .toList(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
