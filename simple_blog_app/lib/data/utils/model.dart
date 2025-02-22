import 'package:simple_blog_app/data/user/model.dart';

class Utils {
  final User? currentUser;
  const Utils({this.currentUser});

  factory Utils.fromJson(Map<String, dynamic> json) {
    return Utils(currentUser: User.fromJson(json['currentUser']));
  }

  Utils copyWith(Map<String, dynamic> changeParameters) {
    return Utils(
      currentUser: changeParameters['currentUser'] ?? currentUser,
    );
  }

  Map<String, dynamic> toJson() => {
        'currentUser': currentUser?.toJson(),
      };
}
