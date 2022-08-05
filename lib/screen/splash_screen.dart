import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: const MainScreen(),
      title: const Text('contoh splash screen'),
      image: Image.asset('images/logobf.png'),
      photoSize: 150.0,
    );
  }
}
