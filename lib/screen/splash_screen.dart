import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).copyWith().colorScheme.onSecondary,
          backgroundColor: Colors.blueGrey,
        ),
      ),
    );
  }
}
