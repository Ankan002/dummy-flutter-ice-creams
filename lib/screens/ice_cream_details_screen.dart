import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ice_creams/models/ice_cream_model.dart';
import 'package:ice_creams/utils/list_utility.dart';
import 'package:ice_creams/utils/overlay_utility.dart';
import 'package:ice_creams/widgets/section_heading.dart';

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
          elevation: 0,
        ),
        body: SafeArea(
          bottom: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                child: Hero(
                  tag: iceCream.image ?? "",
                  child: CachedNetworkImage(
                    imageUrl: iceCream.image ?? "",
                    fit: BoxFit.cover,
                    width: MediaQuery.sizeOf(context).width,
                    height: 300,
                    color: Colors.orange.withOpacity(0.5),
                    colorBlendMode: BlendMode.color,
                    cacheKey: iceCream.image,
                  ),
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
                      fontSize: 28,
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
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Text(
                    iceCream.description,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.quicksand().fontFamily,
                      letterSpacing: 0.8,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey.shade600,
                    ),
                    maxLines: 4,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Text(
                  "\$ ${iceCream.price}",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.quicksand().fontFamily,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const SectionHeading(title: "Toppings"),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (listContext, index) => Padding(
                    padding: ListUtility.getHorizontalPaddingEdgeInsets(
                      totalLength: iceCream.toppings?.length ?? 0,
                      currentIndex: index,
                      padding: 10.0,
                    ),
                    child: Chip(
                      label: Text(
                        iceCream.toppings?[index] ?? "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: GoogleFonts.quicksand().fontFamily,
                        ),
                      ),
                      backgroundColor: Colors.deepOrange,
                    ),
                  ),
                  itemCount: iceCream.toppings?.length,
                ),
              ),
              const SizedBox(height: 5),
              const SectionHeading(title: "Ingredients"),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (ingredientsContext, index) => Card(
                    child: ListTile(
                      title: Text(iceCream.ingredients[index].name),
                      subtitle:
                          Text("Qty - ${iceCream.ingredients[index].quantity}"),
                    ),
                  ),
                  itemCount: iceCream.ingredients.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
