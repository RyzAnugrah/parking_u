import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sizer/sizer.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';
import 'package:parking_u/main.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash_screen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(
      duration,
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) {
              return BaseWidget();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.0.h),
            Image.asset(
              "assets/images/logo-parking-u.png",
              width: 30.0.w,
              height: 10.0.h,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                0.0.w,
                3.0.h,
                0.0.w,
                0.0.h,
              ),
            ),
            Image.asset(
              "assets/images/logo-parking-u-text.png",
              width: 65.0.w,
              height: 8.0.h,
            ),
            Text(
              'Cari parkir tidak pernah semudah ini',
              style: TextStyle(
                fontSize: caption.sp,
                color: secondaryTextColor,
              ),
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
