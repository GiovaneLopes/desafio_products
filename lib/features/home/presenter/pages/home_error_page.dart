import 'package:desafio_products/core/resources/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeErrorPage extends StatefulWidget {
  const HomeErrorPage({super.key});

  @override
  State<HomeErrorPage> createState() => _HomeErrorPageState();
}

class _HomeErrorPageState extends State<HomeErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Column(
              children: [
                Image.asset(Images.errorIllustration),
                Text(
                  'Something went wrong',
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Go Home',
                style: GoogleFonts.poppins(
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
