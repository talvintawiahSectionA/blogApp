import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_blog_app/config/state.dart';
import 'package:simple_blog_app/data/user/actions.dart';
import 'package:simple_blog_app/data/user/constants.dart';

class RegisterViewModel {
  final bool isLoading;
  final Function(String, String, String, BuildContext) registerUser;
  final String? Function(String?) validateUsername;
  final String? Function(String?) validateEmail;
  final String? Function(String?) validatePassword;

  RegisterViewModel({
    required this.isLoading,
    required this.registerUser,
    required this.validateUsername,
    required this.validateEmail,
    required this.validatePassword,
  });

  static RegisterViewModel fromStore(Store<AppState> store) {
    return RegisterViewModel(
      isLoading: store.state.loadingState.isLoading(REGISTER_USER_LOADINGKEY),
      registerUser: (
        String username,
        String email,
        String password,
        BuildContext context,
      ) {
        store.dispatch(
          RegisterUserAction(
            username: username,
            email: email,
            password: password,
            context: context,
            onSuccess: () {
              context.go('/');
            },
          ),
        );
      },
      validateUsername: (String? value) {
        if (value == null || value.isEmpty) {
          return "Username cannot be empty";
        }
        return null;
      },
      validateEmail: (String? value) {
        if (value == null || value.isEmpty) {
          return "Email cannot be empty";
        }
        if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
            .hasMatch(value)) {
          return "Enter a valid email";
        }
        return null;
      },
      validatePassword: (String? value) {
        if (value == null || value.isEmpty) {
          return "Password cannot be empty";
        }
        if (value.length < 6) {
          return "Password must be at least 6 characters";
        }
        return null;
      },
    );
  }
}

class LoginViewModel {
  final bool isLoading;
  final Function(String, String, BuildContext) loginUser;
  final String? Function(String?) validateEmail;
  final String? Function(String?) validatePassword;

  LoginViewModel({
    required this.isLoading,
    required this.loginUser,
    required this.validateEmail,
    required this.validatePassword,
  });

  static LoginViewModel fromStore(Store<AppState> store) {
    return LoginViewModel(
      isLoading: store.state.loadingState.isLoading(LOGIN_USER_LOADINGKEY),
      loginUser: (String email, String password, BuildContext context) {
        store.dispatch(
          LoginUserAction(
              email: email,
              password: password,
              context: context,
              onSuccess: () {
                context.go('/');
              }),
        );
      },
      validateEmail: (String? value) {
        if (value == null || value.isEmpty) {
          return "Email cannot be empty";
        }
        if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
            .hasMatch(value)) {
          return "Enter a valid email";
        }
        return null;
      },
      validatePassword: (String? value) {
        if (value == null || value.isEmpty) {
          return "Password cannot be empty";
        }
        if (value.length < 6) {
          return "Password must be at least 6 characters";
        }
        return null;
      },
    );
  }
}
