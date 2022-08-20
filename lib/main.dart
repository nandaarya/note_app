import 'package:flutter/material.dart';
import 'screen/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CatatanKu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        /// mendefinisikan beberapa tema data yang digunakan agar lebih efisien
        primarySwatch: Colors.deepPurple,
        textTheme: const TextTheme(
          headline5: TextStyle(
              fontFamily: 'Sans',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 24),
          bodyText2: TextStyle(
              fontFamily: 'Sans',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20),
          bodyText1: TextStyle(
              fontFamily: 'Sans',
              fontWeight: FontWeight.normal,
              color: Colors.white,
              fontSize: 18),
        ),
      ),
      home: const SplashScreenPage(),
    );
  }
}