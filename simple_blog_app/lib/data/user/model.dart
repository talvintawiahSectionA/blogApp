class User {
  final String? code;
  final String? userName;
  final String? email;

  User({
    this.code,
    this.userName,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      code: data['code'],
      userName: data['userName'],
      email: data['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'userName': userName,
      'email': email,
    };
  }
}
