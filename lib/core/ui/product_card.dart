import 'package:auto_size_text/auto_size_text.dart';
import 'package:desafio_products/features/home/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool? hasFavoriteButton;
  final Function() onPressed;
  final Function()? onFavorited;
  const ProductCard(
      {super.key,
      required this.product,
      required this.onPressed,
      this.onFavorited,
      this.hasFavoriteButton = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
        width: double.infinity,
        height: 164,
        child: Row(
          children: [
            SizedBox(
              height: 121,
              width: 126,
              child: Image.network(product.imageUrl),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          product.title,
                          maxLines: 2,
                          minFontSize: 14,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                '${product.rate.rate} (${product.rate.reviews} reviews)',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (hasFavoriteButton!)
                        IconButton(
                          onPressed: onFavorited,
                          icon: Icon(
                            product.isFavorited
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color:
                                product.isFavorited ? Colors.red : Colors.grey,
                          ),
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          '\$ ${product.price}',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                          minFontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
