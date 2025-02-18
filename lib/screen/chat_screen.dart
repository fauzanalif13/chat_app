import 'package:chat_app/widget/chat_message.dart';
import 'package:chat_app/widget/new_message.dart';
import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void setupPushNotifications() async {
    final fcm = FirebaseMessaging.instance;

    /// WE CAN DECLARE AS A VARIABLE FOR VARIOUS PERMISSION
    // final notificationSettings =
    await fcm.requestPermission();

    fcm.subscribeToTopic('chat');

    ///IT RETURN AN ADDRESS OF DEVICE
    final token = await fcm.getToken();

    ///WE CAN SEND THIS TOKEN VIA HTTP OR FIRESTORE SDK TO A BACKEND
    debugPrint('Token is: $token');
  }

  @override
  void initState() {
    super.initState();

    ///REQUEST PERMISSION FOR PUSH NOTIFICATIONS
    setupPushNotifications();
  }

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
