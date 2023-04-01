import 'package:dio/dio.dart';

abstract class IAuthController {
  Future login(String email, String password);
  Future register();
  Future logout();
}

class AuthController implements IAuthController {
  final Dio _dio = Dio();

  @override
  Future login(String email, String password) async {
    final res = await _dio.post(
      'https://my-json-server.typicode.com/typicode/demo/posts',
      data: {
        'email': email,
        'password': password,
      },
    );
    if (![200, 201].contains(res.statusCode)) throw Exception('Failed');
    return res.data.toString();
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
