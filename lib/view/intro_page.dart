import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dart_movies_app/view/initial_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Color(0xFF05F258),
      Colors.blue,
      Color.fromARGB(255, 47, 255, 0),
      Color.fromARGB(255, 242, 255, 0),
      Color.fromARGB(255, 255, 0, 255),
      Colors.red,
      Color.fromARGB(255, 0, 0, 0),
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 43.0,
      fontFamily: 'Poppins-Black',
    );

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 280.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    speed: const Duration(milliseconds: 800),
                    'DartMovies',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                ],
                totalRepeatCount: 10,
                displayFullTextOnTap: true,
                repeatForever: true,
                isRepeatingAnimation: true,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InitialPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
