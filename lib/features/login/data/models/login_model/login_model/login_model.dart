import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'data.dart';

@immutable
class LoginModel {
  final String? message;
  final Data? data;
  final bool? status;
  final int? code;

  const LoginModel({this.message, this.data, this.status, this.code});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    status: json['status'] as bool?,
    code: json['code'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'message': message,
    'data': data?.toJson(),
    'status': status,
    'code': code,
  };

  LoginModel copyWith({String? message, Data? data, bool? status, int? code}) {
    return LoginModel(
      message: message ?? this.message,
      data: data ?? this.data,
      status: status ?? this.status,
      code: code ?? this.code,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! LoginModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      message.hashCode ^ data.hashCode ^ status.hashCode ^ code.hashCode;
}
