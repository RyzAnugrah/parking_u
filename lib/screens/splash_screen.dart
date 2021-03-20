import 'package:flutter/material.dart';
import 'package:parking_u/screens/home_screen.dart';
import 'dart:async';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return HomeScreen();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 240),
            Image.asset(
              "assets/images/logo-parking-u.png",
              width: 60.0,
              height: 60.0,
            ),
            Image.asset(
              "assets/images/logo-parking-u-text.png",
              width: 200.0,
              height: 90.0,
            ),
            Text(
              'Cari parkir tidak pernah semudah ini',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "assets/images/wave.png",
                width: 370.0,
                height: 345.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
