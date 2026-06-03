import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/image_links.dart';
import 'package:food_delivery_app/constants/text_styles.dart';
import 'package:food_delivery_app/home_screen.dart';
import 'package:food_delivery_app/widgets/app_common_button_widget.dart';

class MapAccessScreen extends StatelessWidget {
  const MapAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onTap() {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false,
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisSize: .min,
            children: [
              Spacer(),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(90)),
                ),
                child: Image.asset(
                  ImageLinks.map,
                  fit: .cover,
                  height: 280,
                  width: 280,
                ),
              ),
              SizedBox(height: 70),
              commonElivatedButton('access location', onTap, showIcon: true),
              SizedBox(height: 50),
              Text(
                'DFOOD WILL ACCESS YOUR LOCATION ONLY WHILE USING THE APP'
                    .toUpperCase(),
                style: CustomTextStyle.senNormalRegular.copyWith(fontSize: 14),
                textAlign: .center,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
