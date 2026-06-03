import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/text_styles.dart';
import 'package:food_delivery_app/ui/screens/map_access_screen.dart';
import 'package:food_delivery_app/widgets/app_common_button_widget.dart';
import 'package:food_delivery_app/widgets/auth_background.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordMatchController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool obscureTextState = true;

  void onRevealText() {
    setState(() {
      obscureTextState = !obscureTextState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AuthScreenBackground(
      heading: 'Sign Up',
      objective: 'Please signup to get started',
      bodyWidget: Form(
        key: _formKey,
        child: Column(
          spacing: 4,
          children: [
            SizedBox(
              width: .infinity,
              child: Text(
                'Name'.toUpperCase(),
                style: CustomTextStyle.senNormalRegular.copyWith(fontSize: 14),
                textAlign: .start,
              ),
            ),
            TextFormField(
              controller: _userNameController,
              decoration: InputDecoration(hintText: 'jon doe'),
              validator: (value) {
                if (_userNameController.text.isEmpty) {
                  return 'Name field must not be empty.';
                }
                return null;
              },
            ),
            SizedBox(height: 15),
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
            SizedBox(height: 15),
            SizedBox(
              width: .infinity,
              child: Text(
                'Password'.toUpperCase(),
                style: CustomTextStyle.senNormalRegular.copyWith(fontSize: 14),
                textAlign: .start,
              ),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: obscureTextState,
              decoration: InputDecoration(
                hintText: '* * * * * *',
                suffixIcon: IconButton(
                  onPressed: onRevealText,
                  icon: obscureTextState
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
              ),
              validator: (password) {
                if (password == null) {
                  return "password field cann't be empty";
                }
                if (password.length < 6) {
                  return "Password must contain at least 6 character";
                }
                final hasSpecial = RegExp(
                  r'[{\}\\|)"(*&%^!@#\$\-_\+><\)(\?/~`]',
                ).hasMatch(password);
                if (!hasSpecial) {
                  return 'Password should contain special character';
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            SizedBox(
              width: .infinity,
              child: Text(
                'Password'.toUpperCase(),
                style: CustomTextStyle.senNormalRegular.copyWith(fontSize: 14),
                textAlign: .start,
              ),
            ),
            TextFormField(
              controller: _passwordMatchController,
              obscureText: obscureTextState,
              decoration: InputDecoration(
                hintText: '* * * * * *',
                suffixIcon: IconButton(
                  onPressed: onRevealText,
                  icon: obscureTextState
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
              ),
              validator: (password) {
                if (password == null) {
                  return "password field cann't be empty";
                }
                if (password.length < 6) {
                  return "Password must contain at least 6 character";
                }
                final hasSpecial = RegExp(
                  r'[{\}\\|)"(*&%^!@#\$\-_\+><\)(\?/~`]',
                ).hasMatch(password);
                if (!hasSpecial) {
                  return 'Password should contain special character';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            commonElivatedButton('Sign Up', () {
              if (_formKey.currentState?.validate() ?? false) {
                if (_passwordController.text == _passwordMatchController.text) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => MapAccessScreen()),
                    (route) => false,
                  );
                } else {
                  BotToast.showSimpleNotification(
                    title: 'Password did not match, please try again.',
                  );
                }
              }
            }),
          ],
        ),
      ),
    );
  }
}
