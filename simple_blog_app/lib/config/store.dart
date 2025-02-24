import 'package:async_redux/async_redux.dart';
import 'package:simple_blog_app/config/state.dart';

Store<AppState> createStore() {
  return Store<AppState>(
    initialState: AppState.initial(),
    actionObservers: [Log.printer(formatter: Log.verySimpleFormatter)],
  );
}
