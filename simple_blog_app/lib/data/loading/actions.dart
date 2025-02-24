import 'package:async_redux/async_redux.dart';
import 'package:simple_blog_app/config/state.dart';

class StartLoadingAction extends ReduxAction<AppState> {
  final String loadingKey;

  StartLoadingAction({required this.loadingKey});

  @override
  AppState reduce() {
    Map<String, bool>? newLoadingMap = Map<String, bool>.from(
        state.loadingState.loadingMap as Map<String, bool>);
    newLoadingMap[loadingKey] = true;
    return state.copyWith(
        loadingState: state.loadingState.copyWith(loadingMap: newLoadingMap));
  }
}

class StopLoadingAction extends ReduxAction<AppState> {
  final String loadingKey;

  StopLoadingAction({required this.loadingKey});

  @override
  AppState reduce() {
    Map<String, bool>? newLoadingMap = Map<String, bool>.from(
        state.loadingState.loadingMap as Map<String, bool>);
    newLoadingMap[loadingKey] = false;
    return state.copyWith(
        loadingState: state.loadingState.copyWith(loadingMap: newLoadingMap));
  }
}
