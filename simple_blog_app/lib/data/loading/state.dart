import 'package:flutter/material.dart';

@immutable
class LoadingState {
  final Map<String, bool>? loadingMap;

  const LoadingState({this.loadingMap});

  LoadingState copyWith({Map<String, bool>? loadingMap}) {
    return LoadingState(loadingMap: loadingMap ?? this.loadingMap);
  }

  bool isLoading(String key) => loadingMap?[key] ?? false;

  static LoadingState initialState() {
    return LoadingState(loadingMap: {});
  }
}
