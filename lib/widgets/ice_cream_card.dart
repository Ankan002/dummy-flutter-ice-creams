import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ice_creams/models/ice_cream_model.dart';

class IceCreamCard extends StatelessWidget {
  final IceCream iceCream;

  const IceCreamCard({
    super.key,
    required this.iceCream,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.orange.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: iceCream.image ?? "",
            child: CachedNetworkImage(
              imageUrl: iceCream.image ?? "",
              fit: BoxFit.cover,
              color: Colors.orange.withOpacity(0.5),
              colorBlendMode: BlendMode.color,
              cacheKey: iceCream.image,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    iceCream.flavour,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "\$${iceCream.price}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
