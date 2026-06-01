import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/image_links.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final List<AnimationController> _animationControllers;
  late final List<AnimationController> _resizeAnimationController;
  late final List<Animation<double>> _rotations;
  late final List<Animation<double>> _resizes;

  @override
  void initState() {
    _animationControllers = List.generate(
      2,
      (i) => AnimationController(vsync: this, duration: Duration(seconds: 4)),
    );
    _rotations = _animationControllers
        .map(
          (c) => Tween<double>(
            begin: 0,
            end: pi,
          ).animate(CurvedAnimation(parent: c, curve: Curves.easeOutBack)),
        )
        .toList();

    //RESIZE ANIMATION PART OF THE DECORATION

    _resizeAnimationController = List.generate(
      2,
      (i) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000),
      ),
    );

    _resizes = _resizeAnimationController
        .map(
          (c) => Tween<double>(
            begin: 80,
            end: -180,
          ).animate(CurvedAnimation(parent: c, curve: Curves.easeIn)),
        )
        .toList();
    for (var controller in _resizeAnimationController) {
      controller.forward();
    }
    for (var controller in _animationControllers) {
      controller.forward();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _resizes[0],
            builder: (context, child) {
              return Positioned(
                left: MediaQuery.of(context).size.width - 10,
                right: -90,
                top: MediaQuery.of(context).size.height - 50,
                bottom: _resizes[0].value,
                child: AnimatedDecorationCircle(
                  listenable: _rotations[0],
                  height: 180,
                  width: 10,
                  colors: [
                    Colors.deepOrangeAccent,
                    Colors.orangeAccent,
                    Colors.orange,
                  ],
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _resizes[1],
            builder: (context, child) {
              return Positioned(
                left: 0,
                right: 190,
                top: 0,
                bottom: MediaQuery.of(context).size.height + _resizes[1].value,
                child: AnimatedDecorationCircle(
                  listenable: _rotations[1],
                  height: 90,
                  width: 5,
                  colors: [Colors.grey, Colors.grey.shade500, Colors.white24],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AnimatedDecorationCircle extends AnimatedWidget {
  const AnimatedDecorationCircle({
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
        child: DecorationCircle(height: 180, width: 10, colors: colors),
      ),
    );
  }
}

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
