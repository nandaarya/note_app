import 'package:flutter/material.dart';
import 'package:note_app/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CatatanKu',
      theme: ThemeData(),
      home: MainScreen(),
    );
  }
}