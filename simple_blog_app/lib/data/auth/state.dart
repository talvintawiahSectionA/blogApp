import 'package:flutter/material.dart';
import 'package:simple_blog_app/data/auth/model.dart';

@immutable
class AuthState {
  final Auth? auth;

  const AuthState({this.auth});

  factory AuthState.initial() => const AuthState();

  factory AuthState.fromJson(Map<String, dynamic> data) {
    try {
      return AuthState(
        auth: data['auth'] != null ? Auth.fromJson(data['auth']) : null,
      );
    } catch (error) {
      return const AuthState();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'auth': auth?.toJson(),
    };
  }

  copyWith({Auth? auth}) {
    return AuthState(
      auth: auth ?? this.auth,
    );
  }
}
