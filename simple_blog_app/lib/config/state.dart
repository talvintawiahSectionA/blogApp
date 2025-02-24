import 'package:flutter/material.dart';
import 'package:simple_blog_app/data/auth/state.dart';
import 'package:simple_blog_app/data/loading/state.dart';
import 'package:simple_blog_app/data/user/state.dart';
import 'package:simple_blog_app/data/utils/state.dart';

@immutable
class AppState {
  final UserState userState;
  final UtilsState utilsState;
  final AuthState authState;
  final LoadingState loadingState;

  const AppState({
    this.userState = const UserState(),
    this.utilsState = const UtilsState(),
    this.authState = const AuthState(),
    this.loadingState = const LoadingState(),
  });

  static AppState initial() => AppState(
        userState: UserState.initial(),
        utilsState: UtilsState.initial(),
        authState: AuthState.initial(),
        loadingState: LoadingState.initialState(),
      );

  AppState copyWith({
    UserState? userState,
    UtilsState? utilsState,
    AuthState? authState,
    LoadingState? loadingState,
  }) {
    return AppState(
      userState: userState ?? this.userState,
      utilsState: utilsState ?? this.utilsState,
      authState: authState ?? this.authState,
      loadingState: loadingState ?? this.loadingState,
    );
  }
}
