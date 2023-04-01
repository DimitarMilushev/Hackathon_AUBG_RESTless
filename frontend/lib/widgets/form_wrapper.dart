import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AuthFormWrapper extends StatelessWidget {
  final Widget body;
  const AuthFormWrapper({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 64),
        constraints: BoxConstraints(maxWidth: 248),
        child: body,
      ),
    );
  }
}
