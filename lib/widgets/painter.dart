import 'package:flutter/material.dart';

class DrawingPainter extends CustomPainter {
  final List<List<Offset>> lines;
  final Size imageSize;

  DrawingPainter(this.lines, this.imageSize);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    for (final line in lines) {
      for (int i = 0; i < line.length - 1; i++) {
        if (line[i] != null && line[i + 1] != null) {
          // Adjust the painting coordinates to match the image size
          final startPoint = Offset(
            line[i].dx * imageSize.width / size.width,
            line[i].dy * imageSize.height / size.height,
          );
          final endPoint = Offset(
            line[i + 1].dx * imageSize.width / size.width,
            line[i + 1].dy * imageSize.height / size.height,
          );

          canvas.drawLine(startPoint, endPoint, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
