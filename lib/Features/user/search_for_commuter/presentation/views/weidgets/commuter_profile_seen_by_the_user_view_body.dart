import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wheel_n_deal/Core/utils/assets.dart';
import 'package:wheel_n_deal/Core/utils/responsive.dart';
import 'package:wheel_n_deal/Core/utils/styles.dart';
import 'package:wheel_n_deal/Features/user/profile/presentation/views/widgets/edit_profile_button.dart';
import 'package:wheel_n_deal/Features/user/search_for_commuter/presentation/views/weidgets/commuter_profile_details_item.dart';
import 'package:wheel_n_deal/constants.dart';

class CommuterProfileSeenByTheUserViewBody extends StatelessWidget {
  const CommuterProfileSeenByTheUserViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: Responsive.screenWidth(context),
                  child: Image.asset(
                    AssetsData.backGroundImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  right: 25,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              SizedBox(
                                height: 64,
                                child: Image.asset(
                                  AssetsData.profileImage,
                                ),
                              ),
                              Positioned(
                                bottom: -10,
                                left: 5,
                                right: 5,
                                child: Container(
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "4.5",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Spacer(),
                                        SvgPicture.asset(
                                          AssetsData.starIcon,
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Omar",
                                style: Styles.manropeExtraBold32.copyWith(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Total",
                                        style: Styles.cairoRegular
                                            .copyWith(fontSize: 16),
                                      ),
                                      Text(
                                        "30 Delivers",
                                        style: Styles.cairoRegular
                                            .copyWith(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Cancel",
                                        style: Styles.cairoRegular
                                            .copyWith(fontSize: 16),
                                      ),
                                      Text(
                                        "2 Delivers",
                                        style: Styles.cairoRegular
                                            .copyWith(fontSize: 16),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -24,
                  right: 16,
                  child: EditProfileButton(
                    color: kPrimaryColor,
                    text: 'Messaging',
                    textColor: Colors.black,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 26,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Details",
                      style: Styles.manropeMedium18,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommuterProfileDetailsItem(
                    icon: AssetsData.phoneIcon,
                    text: "Phone Number",
                    widget: Row(
                      children: [
                        Text(
                          "+20 1554111002",
                          style: Styles.manropeRegular15.copyWith(
                            letterSpacing: 4.42,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  CommuterProfileDetailsItem(
                    icon: AssetsData.phoneIcon,
                    text: "Phone Number",
                    widget: Row(
                      children: [
                        Text(
                          "+20 1554111002",
                          style: Styles.manropeRegular15.copyWith(
                            letterSpacing: 4.42,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}