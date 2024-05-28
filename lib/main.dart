import 'package:dart_movies_app/bloc/media/media_bloc.dart';
import 'package:dart_movies_app/others/service_hive.dart';
import 'package:dart_movies_app/view/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceHive serviceHive = ServiceHive();
  await serviceHive.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MediaBloc(),
      child: MaterialApp(
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
        home: const IntroPage(),
      ),
    );
  }
}
