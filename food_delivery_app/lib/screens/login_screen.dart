import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/app_colors.dart';
import 'package:food_delivery_app/constants/image_links.dart';
import 'package:food_delivery_app/constants/text_styles.dart';
import 'package:food_delivery_app/home_screen.dart';
import 'package:food_delivery_app/screens/forgot_password_screen.dart';
import 'package:food_delivery_app/screens/signup_screen.dart';
import 'package:food_delivery_app/widgets/app_common_button_widget.dart';
import 'package:food_delivery_app/widgets/auth_background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenBackground(
      heading: 'Login',
      objective: 'Please sign in to your existing account',
      bodyWidget: LoginForm(),
      isPopBack: false,
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
    return Form(
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
            style: CustomTextStyle.senNormalRegular.copyWith(fontWeight: .bold),
          ),
          SizedBox(height: 2),
          Row(
            mainAxisAlignment: .center,
            spacing: 30,
            children: [
              GestureDetector(
                onTap: () {},
                child: Image.asset(ImageLinks.facebook, height: 60, width: 60),
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
    );
  }
}
