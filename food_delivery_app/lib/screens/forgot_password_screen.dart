import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/image_links.dart';
import 'package:food_delivery_app/constants/text_styles.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: -10,
            right: -20,
            top: -5,
            child: Image.asset(ImageLinks.loginBackground, fit: BoxFit.cover),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 120,
            child: Column(
              children: [
                Text(
                  'Log in',
                  style: CustomTextStyle.senBoldLarge.copyWith(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                  textAlign: .center,
                ),
                SizedBox(height: 8),
                Text(
                  'Please sign in to your existing account',
                  style: CustomTextStyle.senNormalRegular.copyWith(
                    color: Colors.white,
                    fontSize: 16,
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
                child: Column(
                  spacing: 6,
                  children: [
                    SizedBox(
                      width: .infinity,
                      child: Text(
                        'Email'.toUpperCase(),
                        style: CustomTextStyle.senNormalRegular.copyWith(
                          fontSize: 14,
                        ),
                        textAlign: .start,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'example@gmail.com',
                        ),
                        validator: (input) {
                          if (input == null) {
                            return "Input cann't be null";
                          }
                          if (!input.contains('@')) {
                            return "Please enter valid email.";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
