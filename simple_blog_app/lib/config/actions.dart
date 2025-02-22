import 'package:async_redux/async_redux.dart';
import 'package:simple_blog_app/config/state.dart';

class ResetAppState extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    return AppState.initial();
  }
}
