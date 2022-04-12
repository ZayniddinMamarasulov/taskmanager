import 'package:flutter/material.dart';
import 'package:taskmanager/screens/second_page.dart';
import 'package:taskmanager/screens/thirdpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ThirdPage(),
    );
  }

// group2
}
