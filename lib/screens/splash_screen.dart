import 'package:flutter/material.dart';
import 'package:parking_u/screens/home_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new HomeScreen(),
      title: new Text('Parking.u',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      image: new Image.asset('assets/images/logo-parking-u.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 35.0,
      loaderColor: Colors.blue,
      loadingText: Text('Cari parkir tidak pernah semudah ini'),
    );
  }
}