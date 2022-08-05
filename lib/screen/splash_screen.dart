import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5, //mengatur waktu
      navigateAfterSeconds: MainScreen(),
      title: new Text('contoh splash screen'),
      image: Image.asset('assets/images/splashscreen.png'),
      photoSize: 150.0,
    );
  }
}
