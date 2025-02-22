import 'package:async_redux/async_redux.dart';
import 'package:simple_blog_app/config/state.dart';
import 'package:simple_blog_app/data/user/model.dart';

class ChangeCurrentUserAction extends ReduxAction<AppState> {
  final User? user;
  ChangeCurrentUserAction({required this.user});

  @override
  AppState? reduce() {
    return state.copyWith(
        utilsState: state.utilsState.copyWith(
      utils: state.utilsState.utils.copyWith(
        {
          'currentUser': user,
        },
      ),
    ));
  }
}
