import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/splash_screen/decoration_circle_widget.dart';

class AnimatedRotationCircle extends AnimatedWidget {
  const AnimatedRotationCircle({
    super.key,
    required super.listenable,
    required this.height,
    required this.width,
    required this.colors,
  });

  final double height;
  final double width;
  final List<Color> colors;

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    double rotationAngle = animation.value;
    return Transform(
      transform: Matrix4.identity()..rotateZ(rotationAngle),
      child: SizedBox(
        height: height,
        width: height,
        child: DecorationCircle(height: height, width: width, colors: colors),
      ),
    );
  }
}
