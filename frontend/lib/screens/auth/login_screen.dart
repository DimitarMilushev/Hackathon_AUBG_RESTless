import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/user_model.dart';
import 'package:frontend/providers/auth_providers.dart';
import 'package:frontend/screens/auth/register_screen.dart';
import 'package:frontend/screens/dashboard_screen.dart';
import 'package:frontend/widgets/form_wrapper.dart';
import 'package:frontend/widgets/loading_screen_wrapper.dart';
import 'package:frontend/widgets/rounded_button.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String path = '/login';

  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorMessage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadableScreenWrapper(
      isLoading: _isLoading,
      child: AuthFormWrapper(
        formKey: formKey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login to your account',
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 40),
            TextFormField(
              decoration: InputDecoration(hintText: 'Email...'),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (_) {
                if (errorMessage != null) return '';
              },
            ),
            SizedBox(height: 5),
            TextFormField(
              decoration: InputDecoration(hintText: 'Password...'),
              controller: passwordController,
              obscureText: true,
              keyboardType: TextInputType.text,
              validator: (_) => errorMessage,
            ),
            SizedBox(height: 64),
            RoundedButton(text: 'LOGIN', onPressed: loginPressed)
          ],
        ),
      ),
    );
  }

  void loginPressed() async {
    errorMessage = null;
    // if (formKey.currentState?.validate() ?? false) return;
    setState(() {
      _isLoading = true;
    });
    try {
      final res = await ref.read(authProvider).login(
          UserLoginRequest(emailController.text, passwordController.text));
      ref
          .read(sessionProvider.notifier)
          .loggedIn(res.token, emailController.text);
      if (mounted) context.go(DashboardScreen.path);
    } catch (err) {
      print(err);
      errorMessage = 'Invalid credentials';
      formKey.currentState?.validate();
    }

    setState(() {
      _isLoading = false;
    });
    // context.go('/');
    // if (mounted) context.go(RegisterScreen.path);
  }
}
