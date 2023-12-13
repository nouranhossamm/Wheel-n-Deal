import 'package:flutter/material.dart';
import 'package:wheel_n_deal/Features/auth/forgot_password/views/widgets/otp_verification_view_body.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OtpVerificationViewBody(),
    );
  }
}
