import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: const MainScreen(),
      backgroundColor: Colors.black,
      title: const Text(
          'CatatanKu',
          style: TextStyle(color: Colors.white, fontSize: 40),
      ),
      image: Image.asset('assets/images/splashscreen.png'),
      photoSize: 80.0,
    );
  }
}
