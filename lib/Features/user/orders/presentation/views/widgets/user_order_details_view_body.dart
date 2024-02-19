import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wheel_n_deal/Core/utils/assets.dart';
import 'package:wheel_n_deal/Core/utils/styles.dart';
import 'package:wheel_n_deal/Core/widgets/custom_main_button.dart';
import 'package:wheel_n_deal/Features/user/post_order/presentation/views/widgets/custom_review_summary_item.dart';
import 'package:wheel_n_deal/constants.dart';

class UserOrderDetailsViewBody extends StatefulWidget {
  const UserOrderDetailsViewBody({super.key});

  @override
  State<UserOrderDetailsViewBody> createState() =>
      _UserOrderDetailsViewBodyState();
}

class _UserOrderDetailsViewBodyState extends State<UserOrderDetailsViewBody> {
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Review Summary",
                      style: Styles.manropeExtraBold32.copyWith(fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  if (urlController.text.isNotEmpty)
                    QrImageView(
                      data: urlController.text,
                      size: 170,
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: urlController,
                      decoration: InputDecoration(
                        hintText: "Enter User ID",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Enter User ID",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(kPrimaryColor),
                    ),
                    onPressed: () {
                      setState(() {});
                    },
                    child: const Text("Generate QR Code"),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: const Color(0x7FA3A3A3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomReviewSummaryItem(
                            keyText: 'Sender Name',
                            valText: 'Omar',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomReviewSummaryItem(
                            keyText: 'Sender Phone Number',
                            valText: '01554111002',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomReviewSummaryItem(
                            keyText: 'Receiver Phone Number',
                            valText: '01554111002',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Address",
                            style: Styles.manropeExtraBold32
                                .copyWith(fontSize: 15),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                CustomReviewSummaryItem(
                                  keyText: 'From',
                                  valText: 'Port-said mohammed ali St',
                                ),
                                CustomReviewSummaryItem(
                                  keyText: 'To      ',
                                  valText: 'Tanta',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Order Details",
                            style: Styles.manropeExtraBold32
                                .copyWith(fontSize: 15),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                CustomReviewSummaryItem(
                                  keyText: 'Name   ',
                                  valText: 'Camera',
                                ),
                                CustomReviewSummaryItem(
                                  keyText: 'Count  ',
                                  valText: '2',
                                ),
                                CustomReviewSummaryItem(
                                  keyText: 'Weight',
                                  valText: '0.5 KG',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(
                                      AssetsData.profileImage,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomReviewSummaryItem(
                            keyText: 'Breakable Order',
                            valText: "Yes",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomReviewSummaryItem(
                            keyText: 'Expiry Date',
                            valText: '3-5 Dayes',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomReviewSummaryItem(
                            keyText: 'Expected Price',
                            valText: '100 LE',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: CustomMainButton(
                onPressed: () {},
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
