import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/text_styles.dart';
import 'package:food_delivery_app/ui/screens/otp_verification_screen.dart';
import 'package:food_delivery_app/widgets/app_common_button_widget.dart';
import 'package:food_delivery_app/widgets/auth_background.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AuthScreenBackground(
      heading: 'Forgot Password',
      objective: 'Please enter your registered email address',
      bodyWidget: Form(
        key: _formKey,
        child: Column(
          spacing: 6,
          children: [
            SizedBox(
              width: .infinity,
              child: Text(
                'Email'.toUpperCase(),
                style: CustomTextStyle.senNormalRegular.copyWith(fontSize: 14),
                textAlign: .start,
              ),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(hintText: 'example@gmail.com'),
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
            SizedBox(height: 20),
            commonElivatedButton('Send Code', () {
              if (_formKey.currentState?.validate() ?? false) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    // send "email" to the backend not passing from here
                    builder: (context) =>
                        OtpVerificationScreen(email: _emailController.text),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
