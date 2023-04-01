import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/auth_providers.dart';
import 'package:frontend/screens/auth/login_screen.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends ConsumerWidget {
  static const String path = '/';

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        child: Align(
            child: ElevatedButton(
      onPressed: () {
        ref.read(sessionProvider.notifier).clearSession();
        context.go(LoginScreen.path);
      },
      child: Text('asd'),
    )));
  }
}
