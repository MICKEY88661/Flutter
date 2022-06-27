import 'package:flutter/foundation.dart';

/// reponse form form Covalent
@immutable
class CovalentResponseModel<T> {
  final T? data;
  final bool? error;
  final String? errorMessage;
  final String? errorCode;

  const CovalentResponseModel({
    this.data,
    this.error,
    this.errorCode,
    this.errorMessage,
  });

  factory CovalentResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) {
    final isNull = json['data'] == null;

    return CovalentResponseModel<T>(
      data: isNull ? null : fromJsonT(json['data']),
      error: json['error'] as bool?,
      errorCode: json['error_code'] as String?,
      errorMessage: json['error_message'] as String?,
    );
  }
}
