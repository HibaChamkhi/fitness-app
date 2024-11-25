import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/ui/style/colors.dart';

class CircularChartWidget extends StatelessWidget {
  final double percentage;

  const CircularChartWidget({Key? key, required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(120, 120), // Canvas size
      painter: PieChartPainter(percentage: percentage),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final double percentage;

  PieChartPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = 50;

    // Paint for the full white circle
    final Paint backgroundPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    // Paint for the gradient slice
    final Rect gradientRect =
    Rect.fromCircle(center: center, radius: radius + 10);
    final Paint slicePaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        colors: [
          AppConstants.perfume,
          AppConstants.kobi,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(gradientRect);

    // Draw the full white circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Calculate sweep angle in radians
    final double sweepAngle = (percentage / 100) * 2 * pi;

    // Draw the gradient slice with extended radius
    final double extendedRadius = radius + 10; // Slice extends beyond circle
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: extendedRadius),
      -pi / 2, // Start angle
      sweepAngle, // Sweep angle
      true, // Use center for the slice
      slicePaint,
    );

    // Calculate the midpoint of the slice for text positioning
    final double angle =
        -pi / 2 + sweepAngle / 2; // Midpoint angle of the slice
    final Offset textPosition = Offset(
      center.dx + (radius + -10) * cos(angle), // Adjust radius for text offset
      center.dy + (radius + -10) * sin(angle),
    );

    // Draw percentage text in the center of the slice
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '${percentage.toStringAsFixed(1)}%',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    textPainter.paint(
      canvas,
      textPosition.translate(-textPainter.width / 2, -textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint when percentage changes
  }
}
