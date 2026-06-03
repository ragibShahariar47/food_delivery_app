import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/text_styles.dart';
import 'package:food_delivery_app/ui/screens/login_screen.dart';
import 'package:food_delivery_app/widgets/app_common_button_widget.dart';
import 'package:food_delivery_app/widgets/auth_background.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
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
      heading: 'Setup a password',
      objective: 'Please enter a strong password',
      secondLine: widget.email,
      bodyWidget: Form(
        key: _formKey,
        child: Column(
          spacing: 6,
          children: [
            SizedBox(
              width: .infinity,
              child: Text(
                'password'.toUpperCase(),
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
            commonElivatedButton('Save Password', () {
              if (_formKey.currentState?.validate() ?? false) {
                if (_passwordController.text == _passwordMatchController.text) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
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
