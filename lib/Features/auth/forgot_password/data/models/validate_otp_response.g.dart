// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateOTPResponse _$ValidateOTPResponseFromJson(Map<String, dynamic> json) =>
    ValidateOTPResponse(
      message: json['message'] as String?,
      otpData: json['data'] == null
          ? null
          : OTPData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int?,
    );

Map<String, dynamic> _$ValidateOTPResponseToJson(
        ValidateOTPResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.otpData,
      'status': instance.status,
    };

OTPData _$OTPDataFromJson(Map<String, dynamic> json) => OTPData();

Map<String, dynamic> _$OTPDataToJson(OTPData instance) => <String, dynamic>{};
