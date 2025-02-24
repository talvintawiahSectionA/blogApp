import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:simple_blog_app/components/snackbar.dart';
import 'package:simple_blog_app/config/state.dart';
import 'package:simple_blog_app/data/auth/actions.dart';
import 'package:simple_blog_app/data/auth/auth_service.dart';
import 'package:simple_blog_app/data/auth/model.dart';
import 'package:simple_blog_app/data/loading/actions.dart';
import 'package:simple_blog_app/data/user/constants.dart';
import 'package:simple_blog_app/data/user/model.dart';
import 'package:simple_blog_app/data/utils/actions.dart';

class InsertUserAction extends ReduxAction<AppState> {
  final User user;
  final String userCode;

  InsertUserAction({required this.user, required this.userCode});

  @override
  AppState reduce() {
    final updatedUsersMap = {...state.userState.usersMap, userCode: user};
    return state.copyWith(
        userState: state.userState.copyWith(changeParameters: updatedUsersMap));
  }
}

class InsertUsersAction extends ReduxAction<AppState> {
  final Map<String, User> users;

  InsertUsersAction({required this.users});

  @override
  AppState reduce() {
    final updatedUsersMap = {...state.userState.usersMap, ...users};
    return state.copyWith(
        userState: state.userState.copyWith(changeParameters: updatedUsersMap));
  }
}

class RegisterUserAction extends ReduxAction<AppState> {
  final String username;
  final String email;
  final String password;
  final BuildContext context;
  final Function? onSuccess;

  RegisterUserAction({
    required this.username,
    required this.email,
    required this.password,
    required this.context,
    this.onSuccess,
  });

  @override
  Future<AppState?> reduce() async {
    dispatch(StartLoadingAction(loadingKey: REGISTER_USER_LOADINGKEY));

    try {
      final resData = await AuthServiceAPI.registerUser(
        email: email,
        username: username,
        password: password,
      );

      if (resData == null) {
        throw Exception("Registration failed. Please try again.");
      }

      Auth newAuth = Auth(
        email: resData['email'],
        username: resData['username'],
        token: resData['accessToken'],
      );
      dispatch(ChangeCurrentAuthAction(auth: newAuth));

      User newUser = User(
        email: resData['email'],
        username: resData['username'],
        code: resData['code'],
      );
      dispatch(ChangeCurrentUserAction(user: newUser));

      previewSuccess(message: "Successfully registered user", context: context);
      onSuccess?.call();
    } catch (e) {
      print("Error in RegisterUserAction: $e");
      previewError(message: e.toString(), context: context);
    } finally {
      dispatch(StopLoadingAction(loadingKey: REGISTER_USER_LOADINGKEY));
    }

    return null;
  }
}

class LoginUserAction extends ReduxAction<AppState> {
  final String email;
  final String password;
  final BuildContext context;
  final Function? onSuccess;

  LoginUserAction({
    required this.email,
    required this.password,
    required this.context,
    this.onSuccess,
  });

  @override
  Future<AppState?> reduce() async {
    dispatch(StartLoadingAction(loadingKey: LOGIN_USER_LOADINGKEY));

    try {
      final resData =
          await AuthServiceAPI.loginUser(email: email, password: password);

      if (resData == null) {
        throw Exception("Error logging in User");
      }

      Auth newAuth = Auth(
        email: resData['email'],
        username: resData['username'],
        token: resData['accessToken'],
      );
      dispatch(ChangeCurrentAuthAction(auth: newAuth));

      User newUser = User(
        email: resData['email'],
        username: resData['username'],
        code: resData['code'],
      );
      dispatch(ChangeCurrentUserAction(user: newUser));
      onSuccess?.call();
    } catch (e) {
      print("Error in RegisterUserAction: $e");
      previewError(message: e.toString(), context: context);
    } finally {
      dispatch(StopLoadingAction(loadingKey: LOGIN_USER_LOADINGKEY));
    }
    return null;
  }
}
