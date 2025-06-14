import 'package:chatbot/models/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: message.isUserMessage
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: message.isUserMessage ? CupertinoColors.systemBlue : Colors.white12,
                borderRadius: BorderRadius.circular(21)
              ),
              padding: EdgeInsets.symmetric(vertical: 11, horizontal: 21),
              child: Text(message.text.trim(),
              style: TextStyle(
                color: Colors.white
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
