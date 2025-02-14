import 'package:chat_app/main.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('You logged in!',
            style: Theme.of(context).copyWith().textTheme.bodyLarge),
      ),
    );
  }
}
