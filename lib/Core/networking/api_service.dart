import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wheel_n_deal/Core/networking/api_constants.dart';
import 'package:wheel_n_deal/Features/auth/forgot_password/data/models/forgot_password_response.dart';
import 'package:wheel_n_deal/Features/auth/forgot_password/data/models/send_otp_response.dart';
import 'package:wheel_n_deal/Features/auth/forgot_password/data/models/validate_otp_request_body.dart';
import 'package:wheel_n_deal/Features/auth/forgot_password/data/models/validate_otp_response.dart';
import 'package:wheel_n_deal/Features/auth/signin/data/models/get_user_profile_response.dart';
import 'package:wheel_n_deal/Features/auth/signin/data/models/login_request_body.dart';
import 'package:wheel_n_deal/Features/auth/signin/data/models/login_response.dart';
import 'package:wheel_n_deal/Features/auth/signup/data/models/signup_request_body.dart';
import 'package:wheel_n_deal/Features/auth/signup/data/models/signup_response.dart';
import 'package:wheel_n_deal/Features/user/profile/data/models/update_user_profile_response.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // Login
  @POST(ApiConstants.signin)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  // Signup
  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );

  // Get Profile
  @GET(ApiConstants.getUserProfile)
  Future<GetUserProfileResponse> getProfile(
    @Header('Authorization') String token,
    @Query('id') int id,
  );

  // Forgot Password -----------------------------

  // Send OTP
  @POST(ApiConstants.sendOTP)
  Future<SendOTPResponse> sendOTP(
    @Query('phoneNumber') String phoneNumber,
  );

  // Validate OTP
  @POST(ApiConstants.validateOTP)
  Future<ValidateOTPResponse> validateOTP(
    @Body() ValidateOTPRequestBody validateOTPRequestBody,
  );

  // Forgot Password
  @POST(ApiConstants.forgotPassword)
  Future<ForgotPasswordResponse> forgotPassword(
    @Query('phoneNumber') String phoneNumber,
    @Query('newPassword') String newPassword,
  );

  // Update Profile
  @PUT(ApiConstants.updateProfile)
  @MultiPart()
  Future<UpdateUserProfileResponse> updateUserProfile(
    @Header('Authorization') String token,
    @Part() int id,
    @Part() String fullName,
    @Part() String gender,
    @Part() String city,
    @Part() File profilePicture,
    @Part() String nationalId,
    @Part() String phone,
  );
}
