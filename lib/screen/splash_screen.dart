import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatelessWidget {
  // constructor
  const SplashScreenPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.black,
      seconds: 3,
      navigateAfterSeconds: const MainScreen(),
      title: const Text(
          'CatatanKu',
          style: TextStyle(color: Colors.white, fontSize: 40, fontFamily: 'Sans', fontWeight: FontWeight.normal),
      ),
      loadingText: const Text("memuat catatan..."),
      image: Image.asset('assets/images/splashscreen.png'),
      photoSize: 80.0,
    );
  }
}
