import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/session.dart';

class SessionNotifier extends StateNotifier<Session> {
  SessionNotifier() : super(Session());

  bool get isLoggedIn => state.token != null;
  loggedIn(String token, String email) {
    state = Session(token: token, email: email);
  }

  clearSession() {
    state = Session();
  }
}
