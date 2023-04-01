import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AuthFormWrapper extends StatelessWidget {
  final Key? formKey;
  final Widget body;
  const AuthFormWrapper({super.key, required this.body, this.formKey});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 64),
          constraints: BoxConstraints(maxWidth: 248),
          child: Form(key: formKey, child: body),
        ),
      ),
    );
  }
}
