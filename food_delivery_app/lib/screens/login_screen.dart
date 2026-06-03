import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/constants/app_colors.dart';
import 'package:food_delivery_app/constants/image_links.dart';
import 'package:food_delivery_app/constants/text_styles.dart';
import 'package:food_delivery_app/home_screen.dart';
import 'package:food_delivery_app/screens/forgot_password_screen.dart';
import 'package:food_delivery_app/screens/signup_screen.dart';
import 'package:food_delivery_app/widgets/app_common_button_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
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
            Positioned(left: 0, right: 0, bottom: 0, child: LoginForm()),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscureTextState = true;
  bool saveToken = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void onRevealText() {
    setState(() {
      obscureTextState = !obscureTextState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Form(
          key: _formKey,
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
                  style: CustomTextStyle.senNormalRegular.copyWith(
                    fontSize: 14,
                  ),
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
              Row(
                children: [
                  Checkbox(
                    value: saveToken,
                    onChanged: (value) {
                      setState(() {
                        saveToken = value ?? false;
                      });
                    },
                  ),
                  Text(
                    'Remember Me',
                    style: CustomTextStyle.senNormalRegular.copyWith(
                      fontSize: 14,
                      color: AppColors.smallTextColor,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot Password',
                      style: CustomTextStyle.senNormalRegular.copyWith(
                        fontSize: 14,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              commonElivatedButton('Login', () {
                if (_formKey.currentState?.validate() ?? false) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (route) => false,
                  );
                }
              }),
              Spacer(),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    'Dont have an account?',
                    style: CustomTextStyle.senNormalRegular,
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: CustomTextStyle.senBoldLarge.copyWith(
                        fontSize: 14,
                        color: AppColors.primary,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                'Or',
                style: CustomTextStyle.senNormalRegular.copyWith(
                  fontWeight: .bold,
                ),
              ),
              SizedBox(height: 14),
              Row(
                mainAxisAlignment: .center,
                spacing: 30,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      ImageLinks.facebook,
                      height: 60,
                      width: 60,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(ImageLinks.x, height: 60, width: 60),
                  ),

                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(ImageLinks.apple, height: 60, width: 60),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
