import 'package:frontend/controllers/auth_controller.dart';
import 'package:riverpod/riverpod.dart';

Provider<AuthController> authProvider =
    Provider<AuthController>((ref) => AuthController());
