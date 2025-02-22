import 'package:async_redux/async_redux.dart';
import 'package:simple_blog_app/config/state.dart';
import 'package:simple_blog_app/data/user/model.dart';

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
