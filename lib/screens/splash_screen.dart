import 'package:flutter/material.dart';
import 'package:parking_u/screens/home_screen.dart';
import 'package:parking_u/styles/color_style.dart';
import 'package:parking_u/styles/font_style.dart';
import 'dart:async';
import 'package:sizer/sizer.dart';

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
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return HomeScreenPage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.0.h),
            Image.asset(
              "assets/images/logo-parking-u.png",
              height: 10.0.h,
            ),
            SizedBox(height: 2.0.h),
            Image.asset(
              "assets/images/logo-parking-u-text.png",
              height: 5.0.h,
            ),
            SizedBox(height: 2.0.h),
            Text(
              'Cari parkir tidak pernah semudah ini',
              style: headlineInfo,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  "assets/images/wave.png",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
