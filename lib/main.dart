import 'package:chat_app/screen/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(255, 232, 99, 255),
  surface: const Color.fromARGB(255, 169, 200, 255),
);

final textTheme = GoogleFonts.latoTextTheme().copyWith(
  titleSmall: GoogleFonts.lato(
    fontWeight: FontWeight.bold,
  ),
  titleMedium: GoogleFonts.lato(
    fontWeight: FontWeight.bold,
  ),
  titleLarge: GoogleFonts.lato(
    fontWeight: FontWeight.bold,
  ),
);

final theme = ThemeData().copyWith(
  brightness: Brightness.light,
  colorScheme: colorScheme,
  textTheme: textTheme,
  scaffoldBackgroundColor: colorScheme.surface,
);

final darkTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(),
  textTheme: textTheme,
  scaffoldBackgroundColor: const Color.fromARGB(255, 22, 22, 22),
);

void main() {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      title: 'Flutter Chat App',
      home: AuthScreen(),
    );
  }
}
