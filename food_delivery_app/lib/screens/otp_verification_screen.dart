import 'package:flutter/material.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';
import 'package:food_delivery_app/constants/app_colors.dart';
import 'package:food_delivery_app/widgets/auth_background.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    Future<bool> verifyOtp(dynamic otp) async {
      return true;
    }

    void resendOtp() {}
    return AuthScreenBackground(
      heading: 'Verification',
      objective: 'We have sent an OTP code to your email',
      secondLine: email,
      bodyWidget: OtpKit(
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.only(top: 8),
        title: 'Verify Email',
        subtitle: 'Enter the verification code',
        fieldCount: 4,
        fieldSpacing: 20,
        // Modern field styling
        fieldConfig: OtpFieldConfig.preset(OtpFieldPreset.modern),

        // Smooth animations
        animationConfig: OtpAnimationConfig(
          enableAnimation: true,
          fieldFillAnimationType: FieldFillAnimationType.rotate,
          errorFieldAnimationType: ErrorFieldAnimationType.bounce,
        ),

        // Colors and theming
        primaryColor: AppColors.primary,
        successColor: Colors.green,
        errorColor: Colors.redAccent,
        //async => await verifyOtp(otp)},
        onVerify: (otp) => verifyOtp(otp),
        onResend: () => resendOtp(),
      ),
    );
  }
}
