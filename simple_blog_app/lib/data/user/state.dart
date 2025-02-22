import 'package:flutter/material.dart';
import 'package:simple_blog_app/data/user/model.dart';

@immutable
class UserState {
  final Map<String, User> usersMap;

  const UserState({this.usersMap = const {}});

  factory UserState.initial() => const UserState();

  UserState copyWith({Map<String, User>? changeParameters}) {
    return UserState(usersMap: changeParameters ?? usersMap);
  }
}
