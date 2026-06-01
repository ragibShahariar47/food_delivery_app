import 'package:flutter/material.dart';

class DecorationCircle extends StatelessWidget {
  const DecorationCircle({
    super.key,
    required this.height,
    required this.width,
    required this.colors,
  });

  final double height;
  final double width;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (double i = 0; i <= 43; i++)
          Transform(
            alignment: Alignment.topCenter,
            transform: Matrix4.identity()..rotateZ(i),
            child: ClipPath(
              clipper: CustomShape(),
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: colors,
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path()
      ..lineTo(0, 0)
      ..lineTo(width, height)
      ..lineTo(0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
