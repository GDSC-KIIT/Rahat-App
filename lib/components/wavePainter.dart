import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class WavePainter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: 100,
      ),
      painter: CurvePainter(),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    paint.color = Color(0xFFF37335);
    paint.style = PaintingStyle.fill;
    path.moveTo(0, size.height * 1);
    path.quadraticBezierTo(size.width * 0.235, size.height * 0.1,
        size.width * 0.7, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.237, size.height * 0.65,
        size.width * 2.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    //return oldDelegate != this;
    return true;
  }
}
