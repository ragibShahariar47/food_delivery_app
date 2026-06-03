import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/app_colors.dart';
import 'package:food_delivery_app/ui/screens/splash_screen.dart';
import 'package:bot_toast/bot_toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: ThemeData(
        colorScheme: ColorScheme.of(context).copyWith(primary: AppColors.primary),
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
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFF0F5FA),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none
          ),
          hintStyle: TextStyle(color: AppColors.smallTextColor),
        ),
        iconTheme: IconThemeData(color: AppColors.smallTextColor),
        checkboxTheme: CheckboxThemeData(
          side: BorderSide(color: AppColors.smallTextColor)
        )
      ),
      home: SplashScreen(),
    );
  }
}
