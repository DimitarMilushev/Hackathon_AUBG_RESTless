import 'package:dio/dio.dart';

abstract class IAuthController {
  Future login();
  Future register();
  Future logout();
}

class AuthController implements IAuthController {
  final Dio _dio = Dio();

  @override
  Future login() async {
    final res = await _dio
        .get('https://my-json-server.typicode.com/typicode/demo/posts');
    print(res);
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
