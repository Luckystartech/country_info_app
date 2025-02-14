import 'package:country_info_app/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.fit,
  });

  final String imageUrl;
  final double width;
  final double height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: width,
      height: height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Sizes.p12)),
      child: Image.network(imageUrl, fit: fit),
    );
  }
}
