import 'package:dart_movies_app/view/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.black,
        background: const Color(0xFF0D0D0D),
        primary: const Color(0xFF0D0D0D),
        secondary: const Color(0xFF05F258),
      )),
      home: const HomePage(),
    );
  }
}
