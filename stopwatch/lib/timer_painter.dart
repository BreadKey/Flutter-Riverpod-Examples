import 'package:flutter/material.dart';

class DigitWidget extends StatelessWidget {
  final int digit;

  const DigitWidget({super.key, required this.digit});

  @override
  Widget build(BuildContext context) => Transform(
        transform: Matrix4.skewX(-0.1),
        child: AspectRatio(
          aspectRatio: 0.5,
          child: CustomPaint(
            painter: DigitPainter(digit, Theme.of(context).primaryColor,
                Theme.of(context).focusColor),
          ),
        ),
      );
}

abstract class _DigitalPainter extends CustomPainter {
  final Color activatedColor;
  final Color disabledColor;

  _DigitalPainter(this.activatedColor, this.disabledColor);

  void drawHorizontalLine(Canvas canvas, Offset topLeft, double width,
      double strokeWidth, double padding, bool activated) {
    final lineWidth = width - strokeWidth * 2 - padding * 2;

    final path = Path()
      ..moveTo(
          topLeft.dx + strokeWidth / 2 + padding, topLeft.dy + strokeWidth / 2)
      ..relativeLineTo(strokeWidth / 2, strokeWidth / 2)
      ..relativeLineTo(lineWidth, 0)
      ..relativeLineTo(strokeWidth / 2, -strokeWidth / 2)
      ..relativeLineTo(-strokeWidth / 2, -strokeWidth / 2)
      ..relativeLineTo(-lineWidth, 0);

    canvas.drawPath(
        path, Paint()..color = activated ? activatedColor : disabledColor);
  }

  void drawVerticalLine(Canvas canvas, Offset topLeft, double height,
      double strokeWidth, double padding, bool activated) {
    final lineHeight = height - strokeWidth * 2 - padding;

    final path = Path()
      ..moveTo(
          topLeft.dx + strokeWidth / 2, topLeft.dy + strokeWidth / 2 + padding)
      ..relativeLineTo(strokeWidth / 2, strokeWidth / 2)
      ..relativeLineTo(0, lineHeight)
      ..relativeLineTo(-strokeWidth / 2, strokeWidth / 2)
      ..relativeLineTo(-strokeWidth / 2, -strokeWidth / 2)
      ..relativeLineTo(0, -lineHeight);

    canvas.drawPath(
        path, Paint()..color = activated ? activatedColor : disabledColor);
  }
}

class DigitPainter extends _DigitalPainter {
  final int digit;

  DigitPainter(this.digit, super.activatedColor, super.disabledColor);

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width / 8;
    final padding = strokeWidth / 2;
    final rect = Rect.fromLTWH(
        padding, padding, size.width - padding * 2, size.height - padding * 2);

    final horizontalPoints = [
      rect.topLeft,
      rect.centerLeft - Offset(0, strokeWidth / 2),
      rect.bottomLeft - Offset(0, strokeWidth)
    ];

    final verticalPoints = [
      rect.topLeft,
      rect.centerLeft - Offset(0, strokeWidth / 2),
      rect.topRight - Offset(strokeWidth, 0),
      rect.centerRight - Offset(strokeWidth, strokeWidth / 2)
    ];

    for (final (index, point) in horizontalPoints.indexed) {
      drawHorizontalLine(canvas, point, rect.width, strokeWidth, padding,
          isActivatedHorizontalIndex(index));
    }

    for (final (index, point) in verticalPoints.indexed) {
      drawVerticalLine(canvas, point, rect.height / 2, strokeWidth, padding,
          isActivatedVerticalIndex(index));
    }
  }

  @override
  bool shouldRepaint(covariant DigitPainter oldDelegate) =>
      digit != oldDelegate.digit;

  bool isActivatedHorizontalIndex(int index) {
    switch (digit) {
      case 0:
        return index != 1;
      case 2:
      case 3:
      case 5:
      case 6:
      case 8:
      case 9:
        return true;
      case 4:
        return index == 1;
      case 7:
        return index == 0;
      default:
        return false;
    }
  }

  bool isActivatedVerticalIndex(int index) {
    switch (digit) {
      case 0:
      case 8:
        return true;
      case 1:
      case 3:
        return index >= 2;
      case 2:
        return index == 1 || index == 2;
      case 4:
      case 7:
      case 9:
        return index != 1;
      case 5:
        return index == 0 || index == 3;
      case 6:
        return index != 2;
      default:
        return false;
    }
  }
}

class ColonWidget extends StatelessWidget {
  final bool activated;

  const ColonWidget({super.key, required this.activated});

  @override
  Widget build(BuildContext context) => Transform(
        transform: Matrix4.skewX(-0.1),
        child: AspectRatio(
          aspectRatio: 1 / 8,
          child: CustomPaint(
            painter: ColonPainter(
                Theme.of(context).primaryColor, Theme.of(context).focusColor),
          ),
        ),
      );
}

class ColonPainter extends _DigitalPainter {
  ColonPainter(super.activatedColor, super.disabledColor);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final strokeWidth = size.width;

    drawVerticalLine(canvas, rect.centerLeft - Offset(0, strokeWidth * 2),
        strokeWidth * 2, strokeWidth, 0, true);
    drawVerticalLine(canvas, rect.centerLeft + Offset(0, strokeWidth / 2),
        strokeWidth * 2, strokeWidth, 0, true);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
