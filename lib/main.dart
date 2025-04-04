import 'package:flutter/material.dart';
import 'package:teste_ia/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 75, 24, 161)),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 75, 24, 161),
            textStyle: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
