import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wheel_n_deal/Core/utils/build_app_bar.dart';
import 'package:wheel_n_deal/Core/utils/styles.dart';
import 'package:wheel_n_deal/Features/user/notifications/presentation/views/widgets/user_notifications_view_body.dart';

class UserNotificationsView extends StatelessWidget {
  const UserNotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        text: 'Notifications',
        textStyle: Styles.manropeRegular16.copyWith(
          fontSize: 18,
        ),
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: const UserNotificationsViewBody(),
    );
  }
}