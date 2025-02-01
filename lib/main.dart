import 'package:flutter/material.dart';

final colorScheme = ColorScheme.fromSeed(seedColor: Colors.purple);

final theme = ThemeData().copyWith(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
);

final darkTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromARGB(255, 22, 22, 22),
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
