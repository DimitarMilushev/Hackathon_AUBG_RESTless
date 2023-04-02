import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/tag_model.dart';

enum MatchingScreenStates { searching, match }

class DashboardScreen extends StatefulWidget {
  static const String path = '/';

  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isSearching = true;
  @override
  Widget build(BuildContext context) {
    final tags = _getTags();
    return isSearching
        ? _SearchScreen(
            tags: tags,
            onSearchPressed: () {
              setState(() {
                isSearching = !isSearching;
              });
            })
        : _MatchingScreen();
  }

  _getTags() {
    // mocks
    return [
      Tag(1, 'Tag1'),
      Tag(2, 'Tag2'),
      Tag(3, 'Tag3'),
      Tag(4, 'Tag4'),
      Tag(5, 'Tag5'),
      Tag(10, 'Tag13'),
      Tag(20, 'Tag23'),
      Tag(30, 'Tag33'),
      Tag(40, 'Tag43'),
      Tag(50, 'Tag53'),
    ];
  }
}

class _MatchingScreen extends StatefulWidget {
  const _MatchingScreen({super.key});

  @override
  State<_MatchingScreen> createState() => _MatchingScreenState();
}

class _MatchingScreenState extends State<_MatchingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _SearchScreen extends StatefulWidget {
  final List<Tag> tags;
  final void Function() onSearchPressed;
  const _SearchScreen(
      {super.key, required this.tags, required this.onSearchPressed});

  @override
  State<_SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<_SearchScreen> {
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
                }
              }),
        ),
      ),
      GestureDetector(
          onTap: () => widget.onSearchPressed.call(),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
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
      backgroundColor: Colors.blue,
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
