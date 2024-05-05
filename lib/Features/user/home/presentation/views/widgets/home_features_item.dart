import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wheel_n_deal/Core/utils/styles.dart';
import 'package:wheel_n_deal/constants.dart';

class HomeFeaturesItem extends StatelessWidget {
  const HomeFeaturesItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final String icon;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: const Border(
            bottom: BorderSide(
              color: kPrimaryColor,
              width: 2.0,
            ),
            left: BorderSide(
              color: kPrimaryColor,
              width: 2.0,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(-5, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              text,
              style: Styles.manropeBold32.copyWith(
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
