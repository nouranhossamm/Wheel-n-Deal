import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheel_n_deal/Core/networking/shared_prefs/shred_prefs_constants.dart';
import 'package:wheel_n_deal/Features/auth/signup/data/models/signup_request_body.dart';
import 'package:wheel_n_deal/Features/auth/signup/data/repos/signup_repo.dart';
import 'package:wheel_n_deal/Features/auth/signup/logic/signup_cubit/signup_state.dart';
import '../../../../../Core/networking/shared_prefs/shared_prefs.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController rolController = TextEditingController(text: 'USER');

  void emitSignupState() async {
    emit(const SignupState.loading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
        username: usernameController.text,
        phone: phoneController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        role: rolController.text,
      ),
    );
    response.when(
      success: (signupResponse) async {
        if (signupResponse.status != 200) {
          emit(SignupState.error(error: signupResponse.message ?? ''));
        } else {
          // Save User's Token
          await SharedPrefs.setString(
            key: kToken,
            value: signupResponse.userData!.token!,
          );

          // Save User's Stripe Id
          await SharedPrefs.setString(
            key: kStripeId,
            value: signupResponse.userData!.stripeId!,
          );

          // Save User's Id
          await SharedPrefs.setInt(
            key: kUserId,
            value: signupResponse.userData!.userId!,
          );

          // Save user's Enterd Data
          await SharedPrefs.setString(
            key: kUsername,
            value: usernameController.text,
          );
          await SharedPrefs.setString(
            key: kPhone,
            value: phoneController.text,
          );
          await SharedPrefs.setString(
            key: kPassword,
            value: passwordController.text,
          );
          await SharedPrefs.setString(
            key: kConfirmPassword,
            value: confirmPasswordController.text,
          );
          await SharedPrefs.setString(
            key: kRole,
            value: rolController.text,
          );
          emit(SignupState.success(signupResponse));
        }
      },
      failure: (error) {
        emit(SignupState.error(
            error: error.apiErrorModel.message ?? 'Something went wrong!'));
      },
    );
  }
}
