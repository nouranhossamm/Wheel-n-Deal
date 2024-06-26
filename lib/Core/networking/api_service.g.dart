// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiService implements ApiService {
  _ApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://wheel-n-deal-production.up.railway.app/api/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoginResponse> login(LoginRequestBody loginRequestBody) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginRequestBody.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'auth/signin',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = LoginResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SignupResponse> signup(SignupRequestBody signupRequestBody) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(signupRequestBody.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SignupResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'auth/signup',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = SignupResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetUserProfileResponse> getProfile(
    String token,
    int id,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetUserProfileResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'user/get-normal-user-porfile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GetUserProfileResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SendOTPResponse> sendOTP(String phoneNumber) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'phoneNumber': phoneNumber};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SendOTPResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'OTP/send-otp',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = SendOTPResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ValidateOTPResponse> validateOTP(
      ValidateOTPRequestBody validateOTPRequestBody) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(validateOTPRequestBody.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ValidateOTPResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'OTP/validate-otp',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ValidateOTPResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(
    String phoneNumber,
    String newPassword,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'phoneNumber': phoneNumber,
      r'newPassword': newPassword,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ForgotPasswordResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'OTP/forget-password',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ForgotPasswordResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UpdateUserProfileResponse> updateUserProfile({
    required String token,
    required int id,
    String? fullName,
    String? gender,
    String? city,
    File? profilePicture,
    String? nationalId,
    String? phone,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    _data.fields.add(MapEntry(
      'id',
      id.toString(),
    ));
    if (fullName != null) {
      _data.fields.add(MapEntry(
        'fullName',
        fullName,
      ));
    }
    if (gender != null) {
      _data.fields.add(MapEntry(
        'gender',
        gender,
      ));
    }
    if (city != null) {
      _data.fields.add(MapEntry(
        'city',
        city,
      ));
    }
    if (profilePicture != null) {
      _data.files.add(MapEntry(
        'profilePicture',
        MultipartFile.fromFileSync(
          profilePicture.path,
          filename: profilePicture.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    if (nationalId != null) {
      _data.fields.add(MapEntry(
        'nationalId',
        nationalId,
      ));
    }
    if (phone != null) {
      _data.fields.add(MapEntry(
        'phone',
        phone,
      ));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UpdateUserProfileResponse>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'user/update',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = UpdateUserProfileResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostOrderResponse> postOrder({
    required String token,
    required int userId,
    String? orderName,
    int? countOfOrders,
    int? weight,
    String? breakable,
    String? expiryDate,
    double? expectedPrice,
    File? orderPhoto,
    String? from,
    String? to,
    String? senderName,
    String? senderPhoneNumber,
    String? receiverName,
    String? receiverPhoneNumber,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    _data.fields.add(MapEntry(
      'userId',
      userId.toString(),
    ));
    if (orderName != null) {
      _data.fields.add(MapEntry(
        'orderName',
        orderName,
      ));
    }
    if (countOfOrders != null) {
      _data.fields.add(MapEntry(
        'countOfOrders',
        countOfOrders.toString(),
      ));
    }
    if (weight != null) {
      _data.fields.add(MapEntry(
        'weight',
        weight.toString(),
      ));
    }
    if (breakable != null) {
      _data.fields.add(MapEntry(
        'breakable',
        breakable,
      ));
    }
    if (expiryDate != null) {
      _data.fields.add(MapEntry(
        'expiryDate',
        expiryDate,
      ));
    }
    if (expectedPrice != null) {
      _data.fields.add(MapEntry(
        'expectedPrice',
        expectedPrice.toString(),
      ));
    }
    if (orderPhoto != null) {
      _data.files.add(MapEntry(
        'orderPhoto',
        MultipartFile.fromFileSync(
          orderPhoto.path,
          filename: orderPhoto.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    if (from != null) {
      _data.fields.add(MapEntry(
        'from',
        from,
      ));
    }
    if (to != null) {
      _data.fields.add(MapEntry(
        'to',
        to,
      ));
    }
    if (senderName != null) {
      _data.fields.add(MapEntry(
        'senderName',
        senderName,
      ));
    }
    if (senderPhoneNumber != null) {
      _data.fields.add(MapEntry(
        'senderPhoneNumber',
        senderPhoneNumber,
      ));
    }
    if (receiverName != null) {
      _data.fields.add(MapEntry(
        'receiverName',
        receiverName,
      ));
    }
    if (receiverPhoneNumber != null) {
      _data.fields.add(MapEntry(
        'receiverPhoneNumber',
        receiverPhoneNumber,
      ));
    }
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PostOrderResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'user/create-update',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = PostOrderResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetUserOrdersResponse> getUserOrders({
    required String token,
    required int userId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetUserOrdersResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'user/findAll/${userId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GetUserOrdersResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deleteNotActiveOrder({
    required String token,
    required int orderId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'user/deleteOrder/${orderId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  @override
  Future<void> commuterPostTrip({
    required String token,
    String? from,
    String? to,
    List<String>? paths,
    String? tripPhoto,
    String? startsAt,
    String? endsAt,
    String? capacity,
    String? userId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    if (from != null) {
      _data.fields.add(MapEntry(
        'from',
        from,
      ));
    }
    if (to != null) {
      _data.fields.add(MapEntry(
        'to',
        to,
      ));
    }
    paths?.forEach((i) {
      _data.fields.add(MapEntry('paths', i));
    });
    if (tripPhoto != null) {
      _data.fields.add(MapEntry(
        'day',
        tripPhoto,
      ));
    }
    if (startsAt != null) {
      _data.fields.add(MapEntry(
        'startsAt',
        startsAt,
      ));
    }
    if (endsAt != null) {
      _data.fields.add(MapEntry(
        'endsAt',
        endsAt,
      ));
    }
    if (capacity != null) {
      _data.fields.add(MapEntry(
        'capacity',
        capacity,
      ));
    }
    if (userId != null) {
      _data.fields.add(MapEntry(
        'userId',
        userId,
      ));
    }
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          'commuter/create-update/trip',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}