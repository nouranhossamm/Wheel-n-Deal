import 'package:flutter/material.dart';
import 'package:wheel_n_deal/Core/helpers/extensions.dart';

import 'package:wheel_n_deal/Core/utils/build_app_bar.dart';
import 'package:wheel_n_deal/Core/utils/styles.dart';
import 'package:wheel_n_deal/Features/user/wallet/presentation/views/widgets/user_wallet_view_body.dart';

class UserWalletView extends StatelessWidget {
  const UserWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        text: "Wallet",
        textStyle: Styles.manropeSemiBold16.copyWith(
          fontSize: 18,
        ),
        onPressed: () {
          context.pop();
        },
      ),
      body: const UserWalletViewBody(),
    );
  }
}
