import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/models/user_model.dart';

abstract class IAuthController {
  Future<UserLoginResponse> login(UserLoginRequest data);
  Future register();
  Future logout();
}

class AuthController implements IAuthController {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.134.109:8081',
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 5),
  ));

  @override
  Future<UserLoginResponse> login(UserLoginRequest data) async {
    final res = await _dio.post(
      '/login',
      data: jsonEncode(data.toJson()),
    );
    return UserLoginResponse.fromJson(res.data);
  }

  @override
  Future logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future register() {
    // TODO: implement register
    throw UnimplementedError();
  }
}
