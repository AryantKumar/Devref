import 'package:flutter/material.dart';

class BackgroundGrid extends StatelessWidget {
  final Color color;
  final double opacity;
  final double spacing;
  final double dotSize;

  const BackgroundGrid({
    super.key,
    this.color = Colors.white,
    this.opacity = 0.05,
    this.spacing = 30.0,
    this.dotSize = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GridPainter(
        color: color.withOpacity(opacity),
        spacing: spacing,
        dotSize: dotSize,
      ),
      size: Size.infinite,
    );
  }
}

class _GridPainter extends CustomPainter {
  final Color color;
  final double spacing;
  final double dotSize;

  _GridPainter({
    required this.color,
    required this.spacing,
    required this.dotSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = dotSize;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotSize / 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
