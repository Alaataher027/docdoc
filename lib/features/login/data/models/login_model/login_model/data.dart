import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

@immutable
class Data {
  final String? token;
  final String? username;

  const Data({this.token, this.username});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json['token'] as String?,
    username: json['username'] as String?,
  );

  Map<String, dynamic> toJson() => {'token': token, 'username': username};

  Data copyWith({String? token, String? username}) {
    return Data(
      token: token ?? this.token,
      username: username ?? this.username,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => token.hashCode ^ username.hashCode;
}
