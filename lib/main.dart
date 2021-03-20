import 'package:flutter/material.dart';
import 'package:parking_u/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SplashScreen',
      debugShowCheckedModeBanner: false,
      home: SplashScreenPage(),
    );
  }
}
