import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MapCard extends StatelessWidget {
  final String imagePath;
  final String text;

  const MapCard({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.transparent,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
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
                  opacity: 0.7,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imagePath,
                  ),
                ),
                Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
