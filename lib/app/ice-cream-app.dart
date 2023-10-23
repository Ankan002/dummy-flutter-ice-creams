import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ice_creams/screens/ice-cream-screen.dart';

class IceCreamApp extends StatelessWidget {
  const IceCreamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: GoogleFonts.dmSans().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: const IceCreamScreen(),
    );
  }
}
