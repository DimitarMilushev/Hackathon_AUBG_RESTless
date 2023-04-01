import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/screens/auth/register_screen.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  static String path = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey();
    return Align(
        child: SizedBox(
            width: 224,
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(),
                    TextFormField(),
                    Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: ElevatedButton(
                            onPressed: () => context.push(RegisterScreen.path),
                            child: Text('asd'))),
                  ],
                ))));
  }
}
