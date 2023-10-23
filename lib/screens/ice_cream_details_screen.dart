import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ice_creams/models/ice_cream_model.dart';
import 'package:ice_creams/utils/overlay_utility.dart';

class IceCreamDetailsScreen extends StatelessWidget {
  final IceCream iceCream;

  const IceCreamDetailsScreen({
    super.key,
    required this.iceCream,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: OverlayUtility.getStatusBarOverlayStyles(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            iceCream.flavour,
            style: TextStyle(
              fontFamily: GoogleFonts.quicksand().fontFamily,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              child: CachedNetworkImage(
                imageUrl: iceCream.image ?? "",
                fit: BoxFit.cover,
                width: MediaQuery.sizeOf(context).width,
                height: 300,
                color: Colors.orange.withOpacity(0.5),
                colorBlendMode: BlendMode.color,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Text(
                  iceCream.flavour,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.quicksand().fontFamily,
                    letterSpacing: 0.8,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 4,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                "\$ ${iceCream.price}",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}