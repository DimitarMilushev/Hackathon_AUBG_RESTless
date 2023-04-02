import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:frontend/models/message.dart';
import 'package:frontend/widgets/chat_box.dart';
import 'package:frontend/widgets/messages_list.dart';

class ChatScreen extends StatefulWidget {
  static const String path = '/chat-screen';

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool showAdvisor = true;
  final messages = Queue<Message>();
  Queue<String> phrases = Queue.from(['Hello', 'Not much', 'Nice!']);

  @override
  Widget build(BuildContext context) {
    if (phrases.isNotEmpty && messages.isNotEmpty && messages.length % 2 == 0) {
      messages.add(
        Message(
            idUser: '20',
            urlAvatar:
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
            username: 'Laura',
            message: phrases.first,
            createdAt: DateTime.now()),
      );
      phrases.removeFirst();
    }
    return GestureDetector(
        onTap: () {
          setState(() {
            showAdvisor = false;
          });
        },
        child: Stack(children: [
          if (showAdvisor) ...[
            Positioned(
                bottom: 148,
                right: 124,
                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                          width: 3,
                          color: Theme.of(context).colorScheme.primary)),
                  child: Text('Say `Hello` to your new friend!'),
                )),
            Positioned(
                width: 86,
                height: 86,
                bottom: 128,
                right: 24,
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.network(
                    "https://imgtr.ee/images/2023/04/02/U4JyV.jpg",
                  ),
                  clipBehavior: Clip.hardEdge,
                )),
          ],
          Positioned(
              child: Column(children: [
            Expanded(
                child: MessagesList(
              messages: messages.toList(),
            )),
            ChatBox(callback: (value) {
              setState(() {
                messages.add(Message(
                    idUser: '1',
                    urlAvatar: 'urlAvatar',
                    username: 'username',
                    message: value,
                    createdAt: DateTime.now()));
              });
            }),
          ])),
        ]));
  }
}
