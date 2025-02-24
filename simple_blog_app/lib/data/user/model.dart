class User {
  final String? code;
  final String? username;
  final String? email;

  User({
    this.code,
    this.username,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      code: data['code'],
      username: data['username'],
      email: data['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'username': username,
      'email': email,
    };
  }
}
