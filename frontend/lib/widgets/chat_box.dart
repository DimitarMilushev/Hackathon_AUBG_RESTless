import 'package:flutter/material.dart';

class ChatBox extends StatefulWidget {
  final void Function(String text) callback;
  const ChatBox({super.key, required this.callback});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Expanded(
              child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    gapPadding: 10,
                    borderSide: BorderSide(width: 0))),
            focusNode: focusNode,
            controller: textEditingController,
          )),
          SizedBox(width: 8),
          Align(
              child: Container(
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                  child: IconButton(
                      onPressed: () {
                        final message = textEditingController.text;
                        if (message.isEmpty) return; // Removes empty messages
                        textEditingController.clear();
                        widget.callback(message);
                        focusNode.unfocus();
                      },
                      color: Colors.white,
                      icon: Icon(Icons.send))))
        ]));
  }
}
