import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wheel_n_deal/Core/utils/app_router.dart';
import 'package:wheel_n_deal/Core/utils/styles.dart';
import 'package:wheel_n_deal/Features/user/profile/presentation/views/widgets/edit_profile_button.dart';
import 'package:wheel_n_deal/constants.dart';

void showLogoutConfirmationDialog(
    BuildContext context, VoidCallback onYesPressed) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        title: Text(
          "Are you sure to Log out?",
          style: Styles.manropeSemiBold16.copyWith(fontSize: 24),
        ),
        actions: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EditProfileButton(
                  text: 'Yes',
                  onPressed: () {
                    onYesPressed();
                    GoRouter.of(context).push(AppRouter.kLoginView);
                  },
                  color: kPrimaryColor,
                ),
                EditProfileButton(
                  text: 'No',
                  borderSideColor: Colors.black,
                  textColor: Colors.black,
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      );
    },
  );
}