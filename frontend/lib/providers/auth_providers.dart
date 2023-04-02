import 'package:frontend/controllers/auth_controller.dart';
import 'package:frontend/controllers/match_controller.dart';
import 'package:frontend/controllers/session_controller.dart';
import 'package:frontend/models/session.dart';
import 'package:frontend/providers/dashboard_providers.dart';
import 'package:riverpod/riverpod.dart';

final authProvider = Provider<AuthController>((ref) => AuthController());

final sessionProvider =
    StateNotifierProvider<SessionNotifier, Session>((ref) => SessionNotifier());

final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardController>(
        (ref) => DashboardNotifier());

final matchProvider = Provider<MatchController>(
  (ref) => MatchController(),
);
