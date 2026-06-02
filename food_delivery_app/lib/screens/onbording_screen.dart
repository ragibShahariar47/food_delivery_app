import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/app_colors.dart';
import 'package:food_delivery_app/constants/image_links.dart';
import 'package:food_delivery_app/constants/text_styles.dart';
import 'package:food_delivery_app/screens/login_screen.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  int primaryIndex = 1;
  List<bool> colorList = List.filled(4, false);

  Map<String, String> onboardImageWithTitle = {
    'Get All your Favorites': ImageLinks.onboard_1,
    'Order from chosen chef': ImageLinks.onboard_2,
    'Free delivery offers': ImageLinks.onboard_3,
  };

  void onNextIndexSelected(int index) {
    for (int i = 1; i <= 3; i++) {
      if (i != index) {
        colorList[i] = false;
      }
    }
    colorList[index] = true;
  }

  void onNextTap() {
    setState(() {
      if (primaryIndex + 1 == colorList.length) {
        primaryIndex = 1;
        onNextIndexSelected(primaryIndex);
      } else {
        primaryIndex += 1;
        onNextIndexSelected(primaryIndex);
      }
    });
  }

  void onSkip() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  void initState() {
    onNextIndexSelected(primaryIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              SizedBox(height: 130),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 1000),
                transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child,),
                child: Image.asset(
                  key: ValueKey(onboardImageWithTitle.values.elementAt(primaryIndex-1)),
                  height: 292,
                  width: 240,
                  onboardImageWithTitle.values.elementAt(primaryIndex - 1),
                  fit: .cover,
                ),
              ),
              SizedBox(height: 50),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 700),
                transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child,),
                child: Text(
                  onboardImageWithTitle.keys.elementAt(primaryIndex - 1),
                  key: ValueKey(onboardImageWithTitle.keys.elementAt(primaryIndex - 1)),
                  style: CustomTextStyle.senBoldLarge,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Get all your loved foods in one once place, you just place the orer we do the rest",
                style: CustomTextStyle.senNormalRegular,
                textAlign: .center,
              ),
              SizedBox(height: 30),
              PageIndicator(colorList: colorList),
              SizedBox(height: 70),
              SizedBox(
                height: 64,
                width: 327,
                child: ElevatedButton(
                  onPressed: onNextTap,
                  child: Text('Next'),
                ),
              ),
              SizedBox(height: 10),
              TextButton(onPressed: () {}, child: Text('Skip')),
            ],
          ),
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key, required this.colorList});

  final List<bool> colorList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: .center,
          spacing: 12,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: colorList[0] ? AppColors.primary : AppColors.onPrimary,
                shape: .circle,
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: colorList[1] ? AppColors.primary : AppColors.onPrimary,
                shape: .circle,
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: colorList[2] ? AppColors.primary : AppColors.onPrimary,
                shape: .circle,
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: colorList[3] ? AppColors.primary : AppColors.onPrimary,
                shape: .circle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
