import 'package:flutter/material.dart';
import 'package:wheel_n_deal/Features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:wheel_n_deal/constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kSplashColor,
      body: SplashViewBody(),
    );
  }
}