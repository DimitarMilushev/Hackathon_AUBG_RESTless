import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/auth_providers.dart';
import 'package:frontend/screens/about_screen.dart';
import 'package:frontend/screens/auth/login_screen.dart';
import 'package:frontend/screens/auth/register_screen.dart';
import 'package:frontend/screens/chat_screen.dart';
import 'package:frontend/screens/dashboard_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: GoRouter(
        initialLocation: LoginScreen.path,
        navigatorKey: _rootNavigatorKey,
        routes: ref.watch(routerProvider),
      ),
      builder: (context, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
              title: Text(
            'PlayDate',
            style: Theme.of(context).textTheme.bodyLarge,
          )),
          body: child,
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

bool isLoggedIn = false;

final routerProvider = Provider<List<RouteBase>>(
  (ref) => [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: LoginScreen.path,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RegisterScreen.path,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
        path: DashboardScreen.path,
        builder: (context, state) => const DashboardScreen(),
        redirect: (context, state) =>
            ref.read(sessionProvider.notifier).isLoggedIn
                ? null
                : LoginScreen.path),
    GoRoute(
      path: ChatScreen.path,
      builder: (context, state) => const ChatScreen(),
    ),
    GoRoute(
      path: AboutScreen.path,
      builder: (context, state) => const AboutScreen(),
    ),
  ],
);

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: tabs,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }

  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index = tabs.indexWhere((t) => location == t.initialLocation);
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  // callback used to navigate to the desired tab
  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      // go to the initial location of the selected tab (by index)
      context.go(tabs[tabIndex].initialLocation);
    }
  }
}

class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  const ScaffoldWithNavBarTabItem(
      {required this.initialLocation, required Widget icon, String? label})
      : super(icon: icon, label: label);

  /// The initial location/path
  final String initialLocation;
}

const tabs = [
  ScaffoldWithNavBarTabItem(
    initialLocation: DashboardScreen.path,
    icon: Icon(Icons.home),
    label: 'Dashboard',
  ),
  ScaffoldWithNavBarTabItem(
    initialLocation: ChatScreen.path,
    icon: Icon(Icons.chat),
    label: 'Chat',
  ),
  ScaffoldWithNavBarTabItem(
    initialLocation: AboutScreen.path,
    icon: Icon(Icons.settings),
    label: 'About',
  ),
];
