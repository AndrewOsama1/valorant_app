import 'package:flutter/material.dart';

class Cardff extends StatelessWidget {
  final String imagePath;

  const Cardff({
    required this.imagePath,
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
        child: Image.network(
          imagePath,
          fit: BoxFit.cover,
          height: double.infinity,
        ),
      ),
    );
  }
}
