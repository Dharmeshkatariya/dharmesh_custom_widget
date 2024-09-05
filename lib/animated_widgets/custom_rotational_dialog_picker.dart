import 'dart:math' as math;
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

abstract class RotaryDialConstants {
  static const inputValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];

  static const rotaryRingPadding = 4.0;
  static const rotaryRingWidth = 80.0;

  static const dialNumberPadding = 8.0;
  static const dialNumberRadius =
      rotaryRingWidth / 2 - (rotaryRingPadding + dialNumberPadding);
  static const firstDialNumberPosition = math.pi / 3;

  static const maxRotaryRingAngle = math.pi * 7 / 4;
  static const maxRotaryRingSweepAngle = math.pi / 2 * 3;
}



class RotaryDialBackgroundPainter extends CustomPainter {
  const RotaryDialBackgroundPainter({
    required this.opacity,
  });

  final double opacity;

  @override
  void paint(Canvas canvas, Size size) {
    const ringWidth = RotaryDialConstants.rotaryRingWidth;
    final paint = Paint()
      ..color = Color.fromRGBO(0, 0, 0, opacity)
      ..strokeWidth = ringWidth
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromCircle(
        center: size.centerOffset,
        radius: size.width / 2 - ringWidth / 2,
      ),
      0,
      math.pi * 2.0,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(RotaryDialBackgroundPainter oldDelegate) =>
      oldDelegate.opacity != opacity;
}
class RotaryDialForegroundPainter extends CustomPainter {
  const RotaryDialForegroundPainter({
    required this.numberRadiusFromCenter,
    required this.startAngleOffset,
    required this.sweepAngle,
  });

  final double numberRadiusFromCenter;
  final double startAngleOffset;
  final double sweepAngle;

  @override
  void paint(Canvas canvas, Size size) {
    const firstDialNumberPosition = RotaryDialConstants.firstDialNumberPosition;
    const ringWidth = RotaryDialConstants.rotaryRingWidth;

    final angleOffset = startAngleOffset * firstDialNumberPosition;
    final paint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = ringWidth - RotaryDialConstants.rotaryRingPadding * 2
      ..style = PaintingStyle.stroke;

    canvas
      ..saveLayer(Rect.largest, paint)
      ..drawArc(
        Rect.fromCircle(
          center: size.centerOffset,
          radius: size.width / 2 - ringWidth / 2,
        ),
        angleOffset + firstDialNumberPosition,
        sweepAngle,
        false,
        paint,
      );

    for (int i = 0; i < 10; i++) {
      final offset = Offset.fromDirection(
        angleOffset + math.pi * (-30 - i * 30) / 180,
        numberRadiusFromCenter,
      );

      canvas.drawCircle(
        size.centerOffset + offset,
        RotaryDialConstants.dialNumberRadius,
        Paint()..blendMode = BlendMode.clear,
      );
    }

    canvas.drawCircle(
      size.centerOffset +
          Offset.fromDirection(math.pi / 6, numberRadiusFromCenter),
      ringWidth / 6,
      Paint()
        ..color = Color.fromRGBO(
          255,
          255,
          255,
          sweepAngle / RotaryDialConstants.maxRotaryRingSweepAngle,
        ),
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(RotaryDialForegroundPainter oldDelegate) =>
      oldDelegate.numberRadiusFromCenter != numberRadiusFromCenter &&
          oldDelegate.startAngleOffset != startAngleOffset &&
          oldDelegate.sweepAngle != sweepAngle;
}


extension SizeX on Size {
  Offset get centerOffset => Offset(width / 2, height / 2);
}

extension ListExtension<T> on List<T> {
  List<T> addBetween(T separator) {
    if (length <= 1) {
      return toList();
    }

    final newItems = <T>[];

    for (int i = 0; i < length - 1; i++) {
      newItems.add(this[i]);
      newItems.add(separator);
    }
    newItems.add(this[length - 1]);

    return newItems;
  }
}