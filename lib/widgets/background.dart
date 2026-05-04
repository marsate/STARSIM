import 'package:flutter/material.dart';
import 'dart:ui';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        width: double.infinity,
        color: const Color(0xFF0A0A0A),
        child: Stack(
          children: [
            _orb(
              top: 80,
              left: 80,
              size: 384,
              colors: [
                Colors.blue.withValues(alpha: 0.2),
                Colors.purple.withValues(alpha: 0.2),
              ],
            ),

            _orb(
              bottom: 80,
              right: 80,
              size: 384,
              colors: [
                Colors.deepPurple.withValues(alpha: 0.2),
                Colors.pink.withValues(alpha: 0.2),
              ],
            ),

            _orbCentered(
              size: 500,
              colors: [
                Colors.indigo.withValues(alpha: 0.15),
                Colors.purple.withValues(alpha: 0.15),
              ],
            ),

            _orb(
              top: 40,
              right: 40,
              size: 256,
              colors: [
                Colors.cyan.withValues(alpha: 0.2),
                Colors.blue.withValues(alpha: 0.2),
              ],
            ),

            _orb(
              bottom: 40,
              left: 40,
              size: 288,
              colors: [
                const Color(0xFFC026D3).withValues(alpha: 0.15),
                Colors.deepPurple.withValues(alpha: 0.15),
              ],
            ),

            _dot(
              top: 128,
              rightFactor: 0.25,
              size: 8,
              color: Colors.blue,
              opacity: 0.3,
            ),
            _dot(
              topFactor: 0.25,
              leftFactor: 0.33,
              size: 6,
              color: Colors.purple,
              opacity: 0.4,
            ),
            _dot(
              bottomFactor: 0.33,
              rightFactor: 0.33,
              size: 10,
              color: Colors.purple,
              opacity: 0.25,
            ),
            _dot(
              bottomFactor: 0.25,
              leftFactor: 0.25,
              size: 4,
              color: Colors.pink,
              opacity: 0.35,
            ),
            _dot(
              topFactor: 0.33,
              rightFactor: 0.5,
              size: 6,
              color: Colors.indigo,
              opacity: 0.3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _orb({
    double? top,
    double? bottom,
    double? left,
    double? right,
    required double size,
    required List<Color> colors,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: _blurCircle(size, colors),
    );
  }

  Widget _orbCentered({required double size, required List<Color> colors}) {
    return Center(child: _blurCircle(size, colors));
  }

  Widget _blurCircle(double size, List<Color> colors) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: colors),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 35, sigmaY: 35),
        child: Container(color: Colors.transparent),
      ),
    );
  }

  Widget _dot({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? topFactor,
    double? bottomFactor,
    double? leftFactor,
    double? rightFactor,
    required double size,
    required Color color,
    required double opacity,
  }) {
    return Positioned.fill(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                top:
                    top ??
                    (topFactor != null
                        ? constraints.maxHeight * topFactor
                        : null),
                bottom:
                    bottom ??
                    (bottomFactor != null
                        ? constraints.maxHeight * bottomFactor
                        : null),
                left:
                    left ??
                    (leftFactor != null
                        ? constraints.maxWidth * leftFactor
                        : null),
                right:
                    right ??
                    (rightFactor != null
                        ? constraints.maxWidth * rightFactor
                        : null),
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: opacity),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.1)
      ..strokeWidth = 1;

    const double step = 50;

    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
