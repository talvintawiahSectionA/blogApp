import 'package:flutter/material.dart';
import 'package:simple_blog_app/data/utils/model.dart';

@immutable
class UtilsState {
  final Utils utils;

  const UtilsState({
    this.utils = const Utils(),
  });

  factory UtilsState.initial() => const UtilsState();

  factory UtilsState.fromMap(Map<String, dynamic> data) {
    try {
      return UtilsState(utils: Utils.fromJson(data['utils']));
    } catch (error) {
      return const UtilsState();
    }
  }

  UtilsState copyWith({
    Utils? utils,
  }) {
    return UtilsState(
      utils: utils ?? this.utils,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'utils': utils.toJson(),
    };
  }
}
