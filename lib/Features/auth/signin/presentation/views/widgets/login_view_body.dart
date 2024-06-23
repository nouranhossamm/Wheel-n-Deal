import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wheel_n_deal/Core/helpers/extensions.dart';
import 'package:wheel_n_deal/Core/networking/shared_prefs/shared_prefs.dart';
import 'package:wheel_n_deal/Core/networking/shared_prefs/shred_prefs_constants.dart';
import 'package:wheel_n_deal/Core/routing/routes.dart';
import 'package:wheel_n_deal/Core/utils/assets.dart';
import 'package:wheel_n_deal/Core/widgets/custom_main_button.dart';
import 'package:wheel_n_deal/Core/functions/is_valid_username.dart';
import 'package:wheel_n_deal/Core/utils/styles.dart';
import 'package:wheel_n_deal/Core/widgets/custom_main_text_form_field.dart';
import 'package:wheel_n_deal/Features/auth/signin/logic/login_cubit/login_cubit.dart';
import 'package:wheel_n_deal/Features/auth/signin/logic/login_cubit/login_state.dart';
import 'package:wheel_n_deal/constants.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String? username;

  String? password;

  bool obscureText = true;

  void _togglePasswordIcon() {
    obscureText = !obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: context.read<LoginCubit>().formKey,
          child: BlocListener<LoginCubit, LoginState>(
            listenWhen: (previous, current) =>
                current is Loading ||
                current is Success ||
                current is Error ||
                current is GetUserProfileSuccess,
            listener: (context, state) {
              state.whenOrNull(
                loading: () {
                  showDialog(
                    context: context,
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    ),
                  );
                },
                success: (loginResponse) async {
                  log(
                    '${loginResponse.userData!.token}',
                    name: 'TOKEN',
                  );
                  logUserData(loginResponse);
                  String? role = SharedPrefs.getString(key: kRole);
                  role == 'USER'
                      ? context.pushReplacementNamed(Routes.kUserHomeView)
                      : context.pushReplacementNamed(Routes.kCommuterHomeView);
                },
                error: (error) {
                  setupErrorState(context, error);
                },
              );
            },
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Welcome back! Glad to see you Again!",
                          style: Styles.manropeBold32,
                        ),
                        SizedBox(
                          height: 70,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Username',
                            style: Styles.poppinsSemiBold16.copyWith(
                              color: const Color(0xFFA3A3A3),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomMainTextFormField(
                          onChanged: (data) {
                            username = data;
                          },
                          controller:
                              context.read<LoginCubit>().usernameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username.';
                            } else if (!isValidUsername(value)) {
                              return 'Please enter a valid username.';
                            }
                            return null;
                          },
                          hintText: 'Enter UserName',
                          borderColor: const Color(0xFFA3A3A3),
                          focusedBorderColor: const Color(0xff55433c),
                          enabledBorderColor: const Color(0xFFA3A3A3),
                          inputType: TextInputType.text,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: SvgPicture.asset(AssetsData.userName),
                          ),
                          obscureText: false,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Password',
                            style: Styles.poppinsSemiBold16.copyWith(
                              color: const Color(0xFFA3A3A3),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomMainTextFormField(
                          onChanged: (data) {
                            password = data;
                          },
                          controller:
                              context.read<LoginCubit>().passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password.';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long.';
                            }
                            return null;
                          },
                          hintText: 'Enter Password',
                          borderColor: const Color(0xFFA3A3A3),
                          focusedBorderColor: const Color(0xff55433c),
                          enabledBorderColor: const Color(0xFFA3A3A3),
                          inputType: TextInputType.text,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: SvgPicture.asset(AssetsData.passWord),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _togglePasswordIcon();
                            },
                            child: Icon(
                              obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black,
                            ),
                          ),
                          obscureText: obscureText,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              context.pushNamed(Routes.kForgotPasswodView);
                            },
                            child: Text(
                              "Forgot Password?",
                              style: Styles.manropeSemiBold16.copyWith(
                                color: kPrimaryColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CustomMainButton(
                            text: "Login",
                            onPressed: () async {
                              await validateThenLoginAndFetchUserData(context);
                            },
                            color: kPrimaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 15),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account?  ",
                            style: Styles.manropeRegular15.copyWith(
                              color: const Color(0xFF191D31),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              context.pushNamed(Routes.kRegisterView);
                            },
                            child: Text(
                              "Register Now",
                              style: Styles.manropeRegular15.copyWith(
                                color: const Color(0xFFFF981A),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> validateThenLoginAndFetchUserData(BuildContext context) async {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      if (context.read<LoginCubit>().formKey.currentState!.validate()) {
        await context.read<LoginCubit>().emitLoginState();
        if (State is Success) {
          // ignore: use_build_context_synchronously
          await context.read<LoginCubit>().emitGetUserProfile();
        }
      }
    }
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          textAlign: TextAlign.center,
          style: Styles.manropeBold32.copyWith(
            color: kPrimaryColor,
            fontSize: 15,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: Styles.manropeBold32.copyWith(
                color: kPrimaryColor,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void logUserData(loginResponse) {
    log(
      '${loginResponse.userData!.token}',
      name: 'TOKEN',
    );
    log(
      '${SharedPrefs.getString(key: kUsername)}',
      name: 'UserName',
    );
    log(
      '${SharedPrefs.getString(key: kStripeId)}',
      name: 'StripeId',
    );
    log(
      '${SharedPrefs.getString(key: kPhone)}',
      name: 'Phone',
    );
    log(
      '${SharedPrefs.getString(key: kRole)}',
      name: 'Role',
    );
    log(
      '${SharedPrefs.getInt(key: kUserId)}',
      name: 'UserId',
    );
  }
}