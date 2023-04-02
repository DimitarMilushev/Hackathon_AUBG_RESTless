import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/session.dart';
import 'package:frontend/models/tag_model.dart';
import 'package:frontend/models/user_model.dart';
import 'package:frontend/providers/auth_providers.dart';

class DashboardNotifier extends StateNotifier<DashboardController> {
  DashboardNotifier()
      : super(DashboardController(DashboardStatus.searching, [], []));

  DashboardStatus get status => state.status;

  bool get isLoading => state.isLoading;

  Future getPotentialPartners(WidgetRef ref) async {
    if (isLoading) return;
    state = state.copyWith(isLoading: true);
    final partners = await ref.read(matchProvider).getMatches(state.choices);

    state = state.copyWith(
        isLoading: false,
        status: partners.isEmpty
            ? DashboardStatus.searching
            : DashboardStatus.match,
        potentialPartners: partners);
  }

  void addChoice(Tag tag) {
    state = state.copyWith(choices: [...state.choices, tag]);
  }
}

class DashboardController {
  bool isLoading;
  DashboardStatus status;
  List<Tag> choices;
  List<User> potentialPartners;
  DashboardController(this.status, this.choices, this.potentialPartners,
      {this.isLoading = false});

  DashboardController copyWith({
    DashboardStatus? status,
    List<Tag>? choices,
    List<User>? potentialPartners,
    bool? isLoading,
  }) {
    return DashboardController(status ?? this.status, choices ?? this.choices,
        potentialPartners ?? this.potentialPartners,
        isLoading: isLoading ?? this.isLoading);
  }
}

enum DashboardStatus { searching, match }
