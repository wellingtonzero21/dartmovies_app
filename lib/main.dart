import 'package:dart_movies_app/view/initial_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.black,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          background: const Color(0xFF0D0D0D),
          primary: const Color(0xFF0D0D0D),
          secondary: const Color(0xFF05F258),
        ),
        textTheme: const TextTheme(
          bodySmall:
              TextStyle(color: Colors.white, fontFamily: 'Poppins-SemiBold'),
          bodyMedium:
              TextStyle(color: Colors.white, fontFamily: 'Poppins-SemiBold'),
          bodyLarge:
              TextStyle(color: Colors.white, fontFamily: 'Poppins-SemiBold'),
        ),
      ),
      home: const InitialPage(),
    );
  }
}
