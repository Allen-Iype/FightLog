import 'dart:math';
import 'package:fight_log/app/theme.dart';
import 'package:flutter/material.dart';

/// Circular countdown progress indicator
class CountdownCircle extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final String timeText;
  final bool isWarning;
  final bool isResting;

  const CountdownCircle({
    super.key,
    required this.progress,
    required this.timeText,
    this.isWarning = false,
    this.isResting = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.7;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          CustomPaint(
            size: Size(size, size),
            painter: _CirclePainter(
              progress: 1.0,
              color: AppTheme.surfaceLight,
              strokeWidth: 20,
            ),
          ),

          // Progress circle
          AnimatedBuilder(
            animation: AlwaysStoppedAnimation(progress),
            builder: (context, child) {
              return CustomPaint(
                size: Size(size, size),
                painter: _CirclePainter(
                  progress: progress,
                  color: _getColor(isWarning, isResting),
                  strokeWidth: 20,
                ),
              );
            },
          ),

          // Time text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                timeText,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: _getColor(isWarning, isResting),
                    ),
              ),
              if (isResting)
                Text(
                  'REST',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppTheme.secondaryColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getColor(bool warning, bool resting) {
    if (warning) return AppTheme.warning;
    if (resting) return AppTheme.secondaryColor;
    return AppTheme.primaryColor;
  }
}

/// Custom painter for circular progress
class _CirclePainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  _CirclePainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw arc from top (270 degrees) clockwise
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // Start from top
      2 * pi * progress, // Sweep angle
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_CirclePainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
