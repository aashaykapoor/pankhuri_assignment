import 'package:flutter/material.dart';

import '../colors.dart';

class TagContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryGreen
      ..style = PaintingStyle.fill;
    final paint2 = Paint()
      ..color = Color(0xFF49651B)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.fillType = PathFillType.nonZero;

    path.lineTo(0, 0);
    path.lineTo(size.width * 1, 0);
    path.lineTo(size.width * 0.92, ((size.height - 10) * 0.5));
    path.lineTo(size.width * 1, size.height - 10);
    path.lineTo(0, size.height - 10);
    path.lineTo(0, 0);

    Path behindShape = Path();
    behindShape.moveTo(0, size.height - 10);
    behindShape.lineTo(size.width * 0.10, size.height - 10);
    behindShape.lineTo(size.width * 0.10, size.height);
    canvas.drawPath(path, paint);
    canvas.drawPath(
      behindShape,
      paint2,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
    throw UnimplementedError();
  }
}

class TagWidget extends StatelessWidget {
  final String title;
  final double height;
  final double width;

  TagWidget({this.title, @required this.height, @required this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: CustomPaint(
        painter: TagContainer(),
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.15, top: height * 0.2),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
                fontSize: height * 0.3 ?? 10,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
