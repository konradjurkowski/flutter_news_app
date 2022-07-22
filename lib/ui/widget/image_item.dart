import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  final String? imageUrl;

  const ImageItem({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl == null
        ? Image.asset(
            "assets/images/img_placeholder.jpeg",
            fit: BoxFit.cover,
          )
        : CachedNetworkImage(
            imageUrl: imageUrl!,
            fit: BoxFit.cover,
            errorWidget: (ctx, url, error) => Image.asset(
              "assets/images/img_placeholder.jpeg",
              fit: BoxFit.cover,
            ),
            placeholder: (ctx, url) => Image.asset(
                "assets/images/img_placeholder.jpeg",
                fit: BoxFit.cover),
          );
  }
}
