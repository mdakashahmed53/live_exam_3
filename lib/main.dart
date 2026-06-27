import 'package:flutter/material.dart';
import 'package:liveexam3/presentetion/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Exam',
      home: HomeScreen(),

    );
  }
}
