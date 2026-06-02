import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:food_delivery_app/constants/image_links.dart';
import 'package:food_delivery_app/screens/welcome_screen_one.dart';
import 'package:food_delivery_app/widgets/splash_screen/animated_rotation_circle_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final List<AnimationController> _animationControllers;
  late final List<AnimationController> _resizeAnimationController;
  late final List<Animation<double>> _rotations;
  late final List<Animation<double>> _resizes;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 4000), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomeScreenOne()),
      );
    });

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
  void dispose() {
    for (var controller in _resizeAnimationController) {
      controller.dispose();
    }
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
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
                child: AnimatedRotationCircle(
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
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(ImageLinks.foodLogo, height: 127, width: 377),
          ),
          AnimatedBuilder(
            animation: _resizes[1],
            builder: (context, child) {
              return Positioned(
                left: 0,
                right: 180,
                top: 0,
                bottom: MediaQuery.of(context).size.height + _resizes[1].value,
                child: AnimatedRotationCircle(
                  listenable: _rotations[1],
                  height: 140,
                  width: 7,
                  colors: [
                    Colors.grey.shade400,
                    Colors.grey.shade200,
                    Colors.white24,
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
