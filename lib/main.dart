import 'package:flutter/material.dart';
import 'package:simple_memory_game/HomeScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
          useMaterial3: true,),
      darkTheme: ThemeData.dark(
          useMaterial3: true,
        ),
    );
  }
}
