import 'package:flutter/material.dart';

@immutable
class Auth {
  final String? username;
  final String? email;
  final String? token;

  const Auth({
    this.username,
    this.email,
    this.token,
  });

  factory Auth.fromJson(Map<String, dynamic> authMap) => Auth(
        username: authMap['username'],
        email: authMap['email'],
        token: authMap['token'],
      );

  Auth copyWith(Map<String, dynamic> changeParameters) {
    String? newEmail = changeParameters['email'] ?? email;
    String? newUsername = changeParameters['username'] ?? username;
    String? newToken = changeParameters['token'] ?? token;

    return Auth(
      email: newEmail,
      username: newUsername,
      token: newToken,
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'token': token,
      };
}
