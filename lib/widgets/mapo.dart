import 'dart:ui';
import 'package:flutter/material.dart';

class Mapo extends StatelessWidget {
  final String imagePath;

  const Mapo({
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
