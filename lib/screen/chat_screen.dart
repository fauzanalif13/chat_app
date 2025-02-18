import 'package:chat_app/widget/chat_message.dart';
import 'package:chat_app/widget/new_message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        children: [
          Expanded(child: ChatMessage()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: NewMessage(),
          ),
          SizedBox(
            height: 18,
          )
        ],
      ),
    );
  }
}
