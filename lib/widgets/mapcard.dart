import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MapCardz extends StatelessWidget {
  final String imagePath;

  const MapCardz({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.transparent,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            color: Colors.white.withOpacity(0.1),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Opacity(
                  opacity: 0.9,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imagePath,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
