import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'package:parking_u/routes.dart';
import 'package:parking_u/theme.dart';
// import 'package:parking_u/views/profile/profile_screen.dart';
import 'package:parking_u/views/home/home_screen.dart';
// import 'package:parking_u/views/login/login_screen.dart';
// import 'package:parking_u/views/splash_screen/splash_screen.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode, // Ensures that it is disabled in release mode
        builder: (context) => MyApp(),
      ),
      // MyApp(),
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
                theme: theme(),
                initialRoute: HomeScreen.routeName,
                routes: routes,
              );
          },
        );
      },
    );
  }
}
