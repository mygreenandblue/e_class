import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  List<Color> colors;
  int amount;
  double pick;
  Size? realSize;
  WavePainter(
      {required this.colors, this.amount = 4, this.pick = 30, this.realSize});
  @override
  void paint(Canvas canvas, Size size) {
    size = realSize ?? size;
    var paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: colors,
      ).createShader(Rect.fromPoints(
        Offset.zero,
        Offset(size.width, size.height),
      ));
    var ww = size.width / (amount * 2 - 1);
    var path = Path();
    var hh = true;

    // path.lineTo(0, 0);
    for (var i = 1; i <= (4 * amount - 2); i++) {
      if (i % 2 == 0) {
        path.lineTo(i * ww / 2, 0);
        path.lineTo(i * ww / 2, 0);
      } else {
        if (hh) {
          path.quadraticBezierTo(i * (ww / 2), pick, (i + 1) * ww / 2, 0);
          hh = false;
        } else {
          path.quadraticBezierTo(i * (ww / 2), -pick, (i + 1) * ww / 2, 0);
          hh = true;
        }
      }
    }
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
