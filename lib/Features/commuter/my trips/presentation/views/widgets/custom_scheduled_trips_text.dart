import 'package:flutter/material.dart';
import 'package:wheel_n_deal/Core/utils/styles.dart';

class CustomScheduledTripsText extends StatelessWidget {
  const CustomScheduledTripsText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Styles.manropeBold32.copyWith(fontSize: 12),
    );
  }
}
