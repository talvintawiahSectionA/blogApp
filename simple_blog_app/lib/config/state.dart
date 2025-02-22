import 'package:flutter/material.dart';
import 'package:simple_blog_app/data/auth/state.dart';
import 'package:simple_blog_app/data/user/state.dart';
import 'package:simple_blog_app/data/utils/state.dart';

@immutable
class AppState {
  final UserState userState;
  final UtilsState utilsState;
  final AuthState authState;

  const AppState({
    this.userState = const UserState(),
    this.utilsState = const UtilsState(),
    this.authState = const AuthState(),
  });

  static AppState initial() => AppState(
        userState: UserState.initial(),
        utilsState: UtilsState.initial(),
        authState: AuthState.initial(),
      );

  AppState copyWith(
      {UserState? userState, UtilsState? utilsState, AuthState? authState}) {
    return AppState(
      userState: userState ?? this.userState,
      utilsState: utilsState ?? this.utilsState,
      authState: authState ?? this.authState,
    );
  }
}
