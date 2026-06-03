import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/constants/app_colors.dart';
import 'package:food_delivery_app/constants/image_links.dart';
import 'package:food_delivery_app/constants/text_styles.dart';

class AuthScreenBackground extends StatelessWidget {
  const AuthScreenBackground({
    super.key,
    required this.heading,
    required this.objective,
    required this.bodyWidget,
    this.secondLine = '',
    this.isSecondLineBold = true,
    this.isPopBack = true
  });

  final String heading;
  final String objective;
  final String secondLine;
  final bool isSecondLineBold;
  final Widget bodyWidget;
  final bool isPopBack;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: -10,
              right: -20,
              top: -5,
              child: Image.asset(ImageLinks.loginBackground, fit: BoxFit.cover),
            ),
            Positioned(
              left: 30,
              top: 60,
              child: isPopBack ? CircleAvatar(
                backgroundColor: AppColors.onPrimary,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ): SizedBox(),
            ) ,
            Positioned(
              left: 0,
              right: 0,
              top: secondLine.isNotEmpty ? 100 : 120,
              child: Column(
                spacing: 4,
                children: [
                  Text(
                    heading,
                    style: CustomTextStyle.senBoldLarge.copyWith(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                    textAlign: .center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    objective,
                    style: CustomTextStyle.senNormalRegular.copyWith(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    textAlign: .center,
                  ),
                  if (secondLine.isNotEmpty)
                    Text(
                      secondLine,
                      style: CustomTextStyle.senNormalRegular.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: isSecondLineBold ? .bold : .normal,
                      ),
                      textAlign: .center,
                    ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height - 225,
                width: .infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: bodyWidget,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
