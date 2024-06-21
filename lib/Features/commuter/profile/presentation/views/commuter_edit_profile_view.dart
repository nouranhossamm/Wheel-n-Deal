import 'package:flutter/material.dart';
import 'package:wheel_n_deal/Core/helpers/extensions.dart';

import 'package:wheel_n_deal/Core/utils/build_app_bar.dart';
import 'package:wheel_n_deal/Core/utils/styles.dart';
import 'package:wheel_n_deal/Features/commuter/profile/presentation/views/widgets/commuter_edit_profile_view_body.dart';

class CommuterEditProfileView extends StatefulWidget {
  const CommuterEditProfileView({super.key});

  @override
  State<CommuterEditProfileView> createState() =>
      _CommuterEditProfileViewState();
}

class _CommuterEditProfileViewState extends State<CommuterEditProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        text: 'Profile',
        textStyle: Styles.manropeSemiBold16.copyWith(
          fontSize: 18,
        ),
        onPressed: () {
          context.pop();
        },
      ),
      body: const CommuterEditProfileViewBody(),
    );
  }
}
