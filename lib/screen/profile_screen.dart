import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        spacing: 6,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You in profile screen!'),
          TextButton.icon(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.logout),
            label: Text('Sign Out'),
          )
        ],
      )),
    );
  }
}
