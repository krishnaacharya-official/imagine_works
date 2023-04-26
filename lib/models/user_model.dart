class User {
  final String password;
  final String email;

  User(
    this.password,
    this.email,
  );
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['password'],
      json['email'],
    );
  }
  Map<String, dynamic> toJson() => {"password": password, "email": email};
}
