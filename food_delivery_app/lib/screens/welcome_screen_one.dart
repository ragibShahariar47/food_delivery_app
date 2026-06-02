import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/text_styles.dart';

class WelcomeScreenOne extends StatelessWidget {
  const WelcomeScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: .min,
            children: [
              Container(
                height: 292,
                width: 240,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              SizedBox(height: 50),
              Text('Get All your Favorites', style: CustomTextStyle.senBoldLarge),
              SizedBox(height: 30),
              Text(
                "Get all your loved foods in one once place, you just place the orer we do the rest",
                style: CustomTextStyle.senBoldSmall,
                textAlign: .center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
