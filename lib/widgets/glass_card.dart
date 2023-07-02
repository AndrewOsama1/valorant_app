import 'package:flutter/material.dart';

class GlassnewsCard extends StatelessWidget {
  final String imagePath;

  const GlassnewsCard({
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
        color: Colors.transparent,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35.0),
        child: Container(
          color: Colors.white.withOpacity(0),
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
