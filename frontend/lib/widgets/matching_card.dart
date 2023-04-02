import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/models/tag_model.dart';
import 'package:frontend/models/user_model.dart';
import 'package:frontend/screens/chat_screen.dart';
import 'package:go_router/go_router.dart';

class MatchinCard extends StatelessWidget {
  final User user;
  const MatchinCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(24),
        constraints: BoxConstraints(maxWidth: 320),
        // padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Positioned(
                child: _CardHeader(
                    username: user.username,
                    age: user.age,
                    gender: user.gender)),
            Positioned(
                child: Center(
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 152),
                  child: ElevatedButton(
                    onPressed: () => context.go(ChatScreen.path),
                    child: Text('Start chatting!'),
                  )),
            )),
            Positioned.fill(
                top: 128,
                child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(children: [
                      Row(
                        children: user.interests
                            .map((e) => _getBadge(e, context))
                            .toList(),
                      ),
                      Text(user.bio,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.white))
                    ])))
          ],
        ));
  }

  Badge _getBadge(Tag tag, BuildContext context) {
    return Badge(
      largeSize: 24,
      backgroundColor: Theme.of(context).colorScheme.primary,
      label: Padding(
        padding: EdgeInsets.all(1),
        child: Text(
          tag.name,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  final String username;
  final int age;
  final String gender;
  const _CardHeader({
    super.key,
    required this.username,
    required this.age,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Color(0xFFFFFFF), borderRadius: BorderRadius.circular(20)),
        height: 128,
        child: Row(children: [
          _buildAvatar(),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Username: $username',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white)),
                Text('Age: $age',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white)),
                Text('Gender: $gender',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white)),
              ]),
        ]));
  }

  Widget _buildAvatar() {
    String avatarUrl;
    switch (gender.toLowerCase()) {
      case 'male':
        avatarUrl =
            'https://www.unionmedicalcentre.com.au/wp-content/uploads/2019/04/avatar-male.jpg';
        break;
      case 'female':
        avatarUrl =
            'https://thumbs.dreamstime.com/b/default-avatar-photo-placeholder-profile-icon-default-avatar-photo-placeholder-profile-icon-female-eps-file-easy-to-edit-124557835.jpg';
        break;
      default:
        avatarUrl =
            'https://www.unionmedicalcentre.com.au/wp-content/uploads/2019/04/avatar-male.jpg';
    }
    return Container(
        padding: EdgeInsets.all(20),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(300.0),
            child: Container(child: Image.network(avatarUrl))));
  }
}
