import 'package:flutter/material.dart';

class CircleGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final colors = [
      Colors.purple.shade50,
      const Color.fromARGB(255, 222, 182, 230),
      const Color.fromARGB(255, 182, 128, 191),
      const Color.fromARGB(255, 121, 64, 131),
    ];

    for (int i = 0; i < colors.length; i++) {
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill;

      canvas.drawCircle(center, radius - (i * (radius / colors.length)), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
