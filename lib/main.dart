import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:parking_u/screens/splash_screen.dart';
import 'package:parking_u/styles/color_style.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode, // Ensures that it is disabled in release mode
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizerUtil().init(constraints, orientation);
            return MaterialApp(
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              title: 'Parking.u',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: Theme.of(context).textTheme.apply(
                      fontFamily: 'Poppins',
                      bodyColor: textColor,
                    ),
              ),
              home: SplashScreenPage(),
            );
          },
        );
      },
    );
  }
}
