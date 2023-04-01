import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/screens/auth/login_screen.dart';
import 'package:frontend/screens/auth/register_screen.dart';
import 'package:frontend/screens/dashboard_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: _routerConfig,
      builder: (context, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
              title: Text(
            'PlayDate',
            style: Theme.of(context).textTheme.bodyMedium,
          )),
          body: child,
        ),
      ),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

bool isLoggedIn = false;
final _routerConfig = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const DashboardScreen(),
        redirect: (context, state) => isLoggedIn ? null : LoginScreen.path),
    GoRoute(
      path: LoginScreen.path,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RegisterScreen.path,
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
