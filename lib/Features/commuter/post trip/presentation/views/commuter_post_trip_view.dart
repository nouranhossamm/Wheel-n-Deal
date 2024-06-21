import 'package:flutter/material.dart';
import 'package:wheel_n_deal/Core/helpers/extensions.dart';
import 'package:wheel_n_deal/Core/utils/build_app_bar.dart';
import 'package:wheel_n_deal/Core/utils/styles.dart';
import 'package:wheel_n_deal/Features/commuter/post%20trip/presentation/views/widgets/commuter_post_trip_view_body.dart';

class CommuterPostTripView extends StatelessWidget {
  const CommuterPostTripView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        text: "Post Trip",
        textStyle: Styles.manropeSemiBold16.copyWith(
          fontSize: 18,
        ),
        onPressed: () {
          context.pop();
        },
      ),
      body: const CommuterPostTripViewBody(),
    );
  }
}
