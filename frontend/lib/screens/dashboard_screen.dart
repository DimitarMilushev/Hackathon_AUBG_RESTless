import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/tag_model.dart';
import 'package:frontend/models/user_model.dart';
import 'package:frontend/providers/auth_providers.dart';
import 'package:frontend/providers/dashboard_providers.dart';
import 'package:frontend/widgets/matching_card.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  static const String path = '/';

  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(dashboardProvider.notifier);
    final tags = _getTags();
    return provider.isLoading
        ? const Center(child: CircularProgressIndicator())
        : provider.status == DashboardStatus.searching
            ? _SearchScreen(tags, callback: () {
                // DUMMY FIX cause state is bugged out
                setState(() {});
                Future.delayed(Duration(seconds: 3), () => setState(() {}));
              })
            : _MatchingScreen(
                matches: ref.watch(dashboardProvider).potentialPartners,
              );
  }

  _getTags() {
    // mocks
    return [
      Tag(1, 'Books'),
      Tag(7, 'Cycling'),
      Tag(3, 'Football'),
      Tag(4, 'Astrology'),
      Tag(5, 'Astronomy'),
      Tag(10, 'Hiking'),
      Tag(20, 'Swimming'),
      Tag(30, 'Animals'),
      Tag(40, 'Programming'),
      Tag(50, 'Literature'),
    ];
  }
}

class _MatchingScreen extends StatefulWidget {
  final List<User> matches;
  const _MatchingScreen({required this.matches});

  @override
  State<_MatchingScreen> createState() => _MatchingScreenState();
}

class _MatchingScreenState extends State<_MatchingScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: MatchinCard(
        user: widget.matches[index],
      )),
      Visibility(
          visible: !_reachedEnd,
          maintainAnimation: true,
          maintainInteractivity: true,
          maintainSemantics: true,
          maintainSize: true,
          maintainState: true,
          child: GestureDetector(
              onTap: () {
                if (!_reachedEnd) {
                  setState(() {
                    ++index;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 36,
                    )),
              )))
    ]);
  }

  bool get _reachedEnd => widget.matches.length <= (index + 1);
}

class _SearchScreen extends ConsumerStatefulWidget {
  final List<Tag> tags;
  final callback;
  const _SearchScreen(this.tags, {super.key, required this.callback});

  @override
  ConsumerState<_SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<_SearchScreen> {
  final GlobalKey<FormBuilderState> dropdownKey = GlobalKey();
  Set<Badge> choices = {};
  List<Tag> availableTags = [];

  @override
  void initState() {
    availableTags = widget.tags;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 64),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(8),
        child: Wrap(
          direction: Axis.horizontal,
          children: choices
              .map((e) => Padding(padding: EdgeInsets.all(4), child: e))
              .toList(),
        ),
      ),
      Visibility(
          maintainAnimation: true,
          maintainInteractivity: true,
          maintainSemantics: true,
          maintainSize: true,
          maintainState: true,
          visible: choices.isEmpty,
          child: Text(
            'Choose at least 5 tags to search for a match',
            style: TextStyle(color: Colors.grey),
          )),
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: FormBuilderDropdown(
              name: 'tags',
              items: widget.tags
                  .map((e) => DropdownMenuItem<Tag>(
                        value: e,
                        child: Text(e.name),
                      ))
                  .toList(),
              onChanged: (newValue) {
                if (newValue != null && !choices.contains(newValue)) {
                  setState(() {
                    choices.add(_getBadge(newValue));
                    dropdownKey.currentState?.fields['tags']?.reset();
                  });
                  ref.watch(dashboardProvider.notifier).addChoice(newValue);
                }
              }),
        ),
      ),
      GestureDetector(
          onTap: () {
            if (choices.length < 5) return;
            ref.read(dashboardProvider.notifier).getPotentialPartners(ref);
            widget.callback.call();
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Padding(
                padding: EdgeInsets.all(16),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 36,
                )),
          ))
    ]);
  }

  Badge _getBadge(Tag tag) {
    return Badge(
      largeSize: 32,
      backgroundColor: Theme.of(context).colorScheme.primary,
      label: Padding(
        padding: EdgeInsets.all(4),
        child: Text(
          tag.name,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
