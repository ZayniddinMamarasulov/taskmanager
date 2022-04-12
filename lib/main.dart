import 'package:flutter/material.dart';
import 'package:taskmanager/presintation/screens/main_screen.dart';
import 'package:taskmanager/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }

  // group2
}
