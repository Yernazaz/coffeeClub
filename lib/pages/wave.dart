import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFFFFF4E6)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 70);
    path.cubicTo(115.714, 177.939, 231.336, 175.805, 371.59, 103.076);
    path.cubicTo(537.714, 16.932, 646.372, 82.992, 785, 1);
    path.lineTo(785, 213);
    path.lineTo(785, 226);
    path.cubicTo(762.284, 219.51, 738.074, 220.58, 716.02, 229.052);
    path.lineTo(541.5, 296.086);
    path.cubicTo(480.25, 319.612, 413.88, 326.58, 349.08, 316.284);
    path.lineTo(269.274, 303.604);
    path.cubicTo(175.089, 288.64, 84.074, 258.016, 0, 213);
    path.close();
    canvas.drawPath(path, paint);

    Paint starPaint = Paint()
      ..color = Color(0xFF4B3832)
      ..style = PaintingStyle.fill;

    Path starPath = Path();
    starPath.moveTo(520, 64);
    starPath.lineTo(524.009, 74.704);
    starPath.lineTo(534, 79);
    starPath.lineTo(524.009, 83.296);
    starPath.lineTo(520, 94);
    starPath.lineTo(515.991, 83.296);
    starPath.lineTo(506, 79);
    starPath.lineTo(515.991, 74.704);
    starPath.close();
    canvas.drawPath(starPath, starPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class WaveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, 332),
      painter: WavePainter(),
    );
  }
}
