import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/app_colors.dart';
import 'package:food_delivery_app/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'San',
        scaffoldBackgroundColor: Color(0xffF3F3F3),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontWeight: .bold, fontSize: 14),
            foregroundColor: Colors.white,
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(AppColors.smallTextColor),
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
