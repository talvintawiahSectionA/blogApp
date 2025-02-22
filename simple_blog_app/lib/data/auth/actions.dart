import 'package:async_redux/async_redux.dart';
import 'package:simple_blog_app/config/state.dart';
import 'package:simple_blog_app/data/auth/model.dart';
import 'package:simple_blog_app/data/auth/state.dart';

class ChangeCurrentAuthAction extends ReduxAction<AppState> {
  final Auth? auth;
  ChangeCurrentAuthAction({required this.auth});

  @override
  AppState reduce() {
    AuthState authState = state.authState.copyWith(auth: auth);
    return state.copyWith(authState: authState);
  }
}

class LogoutAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    return state.copyWith(authState: AuthState.initial());
  }
}
