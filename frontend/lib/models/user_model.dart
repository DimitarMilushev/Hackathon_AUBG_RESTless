import 'package:frontend/models/tag_model.dart';

class User {
  final String username;
  final String email;
  final String bio;
  final int age;
  final String city;
  final String country;
  final String gender;
  final RelationshipStatus status;
  final List<Tag> interests;
  User(
    this.username,
    this.email,
    this.bio,
    this.age,
    this.city,
    this.country,
    this.gender,
    this.status,
    this.interests,
  );
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

enum RelationshipStatus { available, unavailable }
