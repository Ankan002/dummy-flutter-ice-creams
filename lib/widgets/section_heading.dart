import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionHeading extends StatelessWidget {
  final String title;

  const SectionHeading({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontFamily: GoogleFonts.manrope().fontFamily,
          fontWeight: FontWeight.w700
        ),
      ),
    );
  }
}
