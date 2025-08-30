import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

Widget netWorkImageCustom({
  required String imageUrl,
  required String heroTag, // Add this for the Hero tag
  double height = 45,
  double width = 45,
  BoxFit fit = BoxFit.fill,
}) {
  final random = Random();
  int randomNumber = 100000 + random.nextInt(900000);
  return Hero(
    tag: randomNumber,
    child: CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      height: height,
      width: width,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.broken_image, size: 24),
      fadeInDuration: Duration(milliseconds: 400),
    ),
  );
}
