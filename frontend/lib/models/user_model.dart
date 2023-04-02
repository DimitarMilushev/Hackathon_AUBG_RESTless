class User {
  final String username;
  final String password;
  User(this.username, this.password);
}

class UserLoginRequest {
  final String username;
  final String password;
  UserLoginRequest(this.username, this.password);

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}

class UserLoginResponse {
  final String token;
  UserLoginResponse(this.token);

  static UserLoginResponse fromJson(Map<String, dynamic> json) =>
      UserLoginResponse(json['token']);
}
