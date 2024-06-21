import 'package:flutter/material.dart';
import 'package:wheel_n_deal/Core/helpers/extensions.dart';
import 'package:wheel_n_deal/Core/utils/build_app_bar.dart';
import 'package:wheel_n_deal/Core/utils/styles.dart';
import 'package:wheel_n_deal/Features/commuter/pick_order/presentation/views/widgets/set_another_expected_price_view_body.dart';

class SetAnotherExpectedPriceView extends StatelessWidget {
  const SetAnotherExpectedPriceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        text: "Set New Price",
        textStyle: Styles.manropeSemiBold16.copyWith(
          fontSize: 18,
        ),
        onPressed: () {
          context.pop();
        },
      ),
      body: const SetAnotherExpectedPriceViewBody(),
    );
  }
}
