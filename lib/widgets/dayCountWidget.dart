import 'package:flutter/material.dart';

import '../colors.dart';

class DayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();
    paint.color = AppColors.primaryGreen;

    Rect rect = (Offset(0, 0) & Size(size.width, size.height));
    Radius radius = Radius.circular(50);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), paint);

    Path path = Path();
    path.moveTo(size.width * 0.48, size.height + 10);
    path.lineTo(size.width * 0.66, size.height * 0.43);
    path.lineTo(size.width * 0.44, size.height * 0.78);
    path.lineTo(size.width * 0.20, size.height * 0.43);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
    throw UnimplementedError();
  }
}

class DayCountWidget extends StatelessWidget {
  final String title;
  DayCountWidget(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 40,
      child: CustomPaint(
        painter: DayPainter(),
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: TextStyle(fontSize: 13, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
