import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?) onChanged;
  const SearchTextFormField(
      {super.key, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        prefixIcon: const Icon(Icons.search_outlined),
        fillColor: Colors.grey.withOpacity(.20),
        filled: true,
        hintText: 'Search Anything',
        hintStyle: GoogleFonts.poppins(),
      ),
    );
  }
}
