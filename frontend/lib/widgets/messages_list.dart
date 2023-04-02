import 'package:flutter/material.dart';
import 'package:frontend/models/message.dart';
import 'package:frontend/widgets/message_bubble.dart';

class MessagesList extends StatelessWidget {
  final List<Message> messages;

  const MessagesList({
    required this.messages,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];

        return MessageBubble(
          message: message,
          isMe: message.idUser == '1',
        );
      },
    );
  }
}

Widget buildText(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24),
      ),
    );
