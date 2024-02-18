import 'package:flutter/material.dart';
import 'package:movieapp/features/home/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Starter',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: HomeScreen(),
    );
  }
}
